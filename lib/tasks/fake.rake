require 'fakeout'

desc "Fakeout data"
task :fake => :environment do
  faker = Fakeout::Builder.new

  # fake users
  faker.users(10000)

  # fake products
  faker.jobs(10000)

  # report
  puts "Faked!\n#{faker.report}"
end