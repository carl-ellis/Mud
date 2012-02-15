# This handles all of the JSON deserialisation and storage methods
#
# 1. Should manage where the data directory is (THIS SHOULD BE SET BY THE CONFIGURATION)
#
# 2. Should retreive files from the data directory and deserialise them.
#    - Some objects may require their dependencies deserialised too
class Repository

	# Static methods needed i.e. storage dir
	class << self
		attr_accessor :data_dir
	end

	# Overloaded method from repository
	# Gets an object from storage
	# Arguments:
	#   id = Object id
	# Returns:
	#   obj = Object
	def get_from_storage(id)
		raise "[FATAL] Storage directory not set" if Repository.data_dir.nil?

		# Aquire raw JSON

		# Create object

		# Grab needed objects, args => self

		# return
	end
end
