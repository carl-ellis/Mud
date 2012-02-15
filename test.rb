require './options.rb'
require './configuration.rb'

# Configur requirements
Options.storage = :json
Options.storage_options[:data_dir] = "./data"
Configuration.configure_using_options(Options)

r = Repository.new(10)

begin
	obj = r.get_from_cache(1)
rescue Exception => e
	puts e
	exit
end
