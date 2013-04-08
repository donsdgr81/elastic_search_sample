class User < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  # Tire uses dynamic mapping by default for indexing your data
  # If you want choose which data to index, you can do it by using the
  # mapping block below

  # Some quick description of different kind of analyzers
  # keyword = Indexes the whole field. Good for specific text like email, zipcode, phone number
  # standard = Grammar based tokenizer that is a good tokenizer for most European language documents
  # snowball = Stemming analyzer

  # Research links for analyzers
  # http://stackoverflow.com/questions/3875382/lucene-standard-analyzer-vs-snowball
  # http://stackoverflow.com/questions/9670016/how-do-i-set-the-default-analyzer-for-elastic-search-with-tire

  mapping do
    indexes :id,           type: "integer" ,index: :not_analyzed

    # Boost increases priority when searching. Default value is 1.0
    indexes :first_name,   type: 'string', index: :not_analyzed, boost: 10

    indexes :last_name,    type: 'string', :index => :not_analyzed
    indexes :email,        :analyzer => 'keyword'
  end

  # You can just use the default #search of Tire
  # Or you can override the method and make your own custom search

  def self.search(params)
    page = (params[:page] || 1).to_i
    per_page = 5

    # To use pagination, you can't pass the page and per_page inside the block
    # so we just declare it as a hash for default search arguments

    tire.search(page: page, per_page: per_page) do
      query { string params[:query] } if params[:query].present?

      # Types for filters available at
      # http://www.elasticsearch.org/guide/reference/query-dsl/
      filter :range, age: { lte: params[:age_filter].to_i } if params[:age_filter].present?
      filter :term, age:params[:age].to_i if params[:age].present?

      sort { by :age, "asc" }
      facet "ages" do
        # Kinds of facets: terms, range, histogram, date histogram, filter, query, statistical,
        # terms stats, geo distance

        # Show 5 highest results by age
        # Order options: count, term, reverse_count or reverse_term
        terms :age, size: 5, order: "term"
      end
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  # If you want to add custom fields to the index use this method
  def to_indexed_json
    to_json(methods: [:name])
  end

end
