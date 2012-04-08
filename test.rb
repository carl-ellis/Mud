require './options.rb'
require './configuration.rb'

# Configur requirements
Options.debug = true
Options.storage = :json
Options.storage_options[:data_dir] = "./data/"
Configuration.configure_using_options(Options)

Repository.new(10)
Repository.repo.freeid(0)

a = Area.new(1,"Lancashire",[])
id =  Repository.create(a)
a = nil

Repository.delete(id)

#obj = Repository.get(7)
#p obj
#Repository.save(7)
