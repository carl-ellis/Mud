require './options.rb'
require './configuration.rb'

# Configur requirements
Options.debug = true
Options.storage = :json
Options.storage_options[:data_dir] = "./data/"
Options.storage_options[:cache_size] = 10
Options.storage_options[:freeid_id] = 0
Configuration.configure_using_options(Options)

Repository.new()
#Repository.repo.freeid(0)

#a = Area.new(1,"Lancashire",[])
#p a
begin

statset = Statset.new(1, [:str, :int, :dex, :con, :cha, :luc])
#p statset
id =  Repository.create(statset)
#a = nil

#Repository.delete(8)

#obj = Repository.get(7)
#p obj
#Repository.save(7)

rescue Exception => e
	puts e.message
end
	
