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

#p a
begin

a = Area.new(1,"Lancashire",[])
#statset = Statset.new(1, [:str, :int, :dex, :con, :cha, :luc])
#p statset
id =  Repository.create(a)
a = nil

Repository.delete(id)

#obj = Repository.get(7)
#p obj
#Repository.save(7)

rescue Exception => e
	puts e.message
end
	
