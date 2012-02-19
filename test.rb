require './options.rb'
require './configuration.rb'

# Configur requirements
Options.debug = true
Options.storage = :json
Options.storage_options[:data_dir] = "./data/"
Configuration.configure_using_options(Options)

Repository.new(10)

obj = Repository.get(7)
p obj
Repository.save(7)
