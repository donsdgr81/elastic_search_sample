class User < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  # Tire uses dynamic mapping by default for indexing your data
  # If you want choose which data to index, you can do it by using the
  # mapping block below

  # Some quick description of different kind of analyzers
  # keyword = Indexes the whole field. Good for specific text like email, zipcode, phone number
  # standard = Grammar based tokenizer that is a good tokenizer for most European language documents
  # snowball =

  # Research links for analyzers
  # http://stackoverflow.com/questions/3875382/lucene-standard-analyzer-vs-snowball
  # http://stackoverflow.com/questions/9670016/how-do-i-set-the-default-analyzer-for-elastic-search-with-tire

  #mapping do
  #  indexes :id,           :index    => :not_analyzed
  #  indexes :first_name,   type: 'string', :index => :not_analyzed
  #  indexes :last_name,    type: 'string', :index => :not_analyzed
  #  indexes :email,        :analyzer => 'keyword'
  #end

  # You can just use the default #search of Tire
  # Or you can override the method and make your own custom search

  def self.search(params)
    page = (params[:page] || 1).to_i
    per_page = 2

    # To use pagination, you can't pass the page and per_page inside the block
    # so we just declare it as a hash for default search arguments

    tire.search(page: page, per_page: per_page) do
      query { string params[:query] } if params[:query].present?
    end
  end

end
