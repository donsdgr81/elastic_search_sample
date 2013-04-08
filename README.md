# Elastic Search Sample App

# To index all classes that uses tire run
# FORCE=true will empty the index and recreate it

rake environment tire:import:all FORCE=true

# Run the rake script to populate sample data
rake fake

# Readme for Query DSL
http://www.elasticsearch.org/guide/reference/query-dsl/