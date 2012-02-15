# Hold options for the MUD
class Options

	# Class variables
	class << self
		
		# storage => Storage model used
		attr_accessor :storage

	end

	# storage_options => options for storage model (needs fancier inits
	@@storage_options = {}

	# Accessor
	def self.storage_options
		@@storage_options
	end

end
