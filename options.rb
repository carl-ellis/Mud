# Hold options for the MUD
class Options

	# Class variables
	class << self
		
		# storage => Storage model used
		# debug => debug on?
		attr_accessor :storage, :debug

	end

	# storage_options => options for storage model (needs fancier inits
	# data_dir
	# cache_size
	# freeid_id
	@@storage_options = {}

	# Accessor
	def self.storage_options
		@@storage_options
	end

end
