require 'faker'

module Fakeout
  class Builder

    FAKEABLE = %w(User Job)

    attr_accessor :report

    def initialize
      self.report = Reporter.new
      clean!
    end

    # create users (can be admins)
    def users(count = 1, options = {})
      1.upto(count) do
        user = User.new({ email:        random_unique_email,
                          first_name:   Faker::Name.first_name,
                          last_name:    Faker::Name.last_name,
                          phone_number: Faker::PhoneNumber.phone_number,
                          address:      Faker::Address.street_address,
                          age:          rand(21..60)}.merge(options))
        user.save
      end
      self.report.increment(:users, count)
    end

    # create products (can be free)
    def jobs(count = 1, options = {})
      1.upto(count) do
        job   = Job.new({ job_title:      Faker::Company.catch_phrase,
                          salary:         2000+Random.rand(5000),
                          company:        Faker::Company.name,
                          skill:          Faker::Lorem.words(1).first,
                          description:    Faker::Lorem.paragraph(2),
                          published_date: Date.today.days_ago(rand(1..365))}.merge(options))
        job.save
      end
      self.report.increment(:products, count)
    end

    # cleans all faked data away
    def clean!
      FAKEABLE.map(&:constantize).map(&:destroy_all)
    end


    private

    def pick_random(model)
      ids = ActiveRecord::Base.connection.select_all("SELECT id FROM #{model.to_s.tableize}")
      model.find(ids[rand(ids.length)]['id'].to_i) if ids
    end

    def random_unique_email
      Faker::Internet.email.gsub('@', "#{User.count}@")
    end
  end


  class Reporter < Hash
    def initialize
      super(0)
    end

    def increment(fakeable, number = 1)
      self[fakeable.to_sym] ||= 0
      self[fakeable.to_sym] += number
    end

    def to_s
      report = ""
      each do |fakeable, count|
        report << "#{fakeable.to_s.classify.pluralize} (#{count})\n" if count > 0
      end
      report
    end
  end
end