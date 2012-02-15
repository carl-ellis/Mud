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
		raw = aquire_raw(id)

		# Create object
		obj = JSON::parse(raw)

		# Grab needed objects, args => self
		obj.collect(self)

		# return
		return obj
	end

private

	# Given that data files are stored {datadir}/{id}.json, retrieve that file or fail
	def aquire_raw(id)
		
		# To return
		raw_data = nil

		# file name
		file_name = "#{Repository.data_dir}#{id}.json"

    # Does the file exist?
		if File.exists?(file_name)

			# Open the file and process
			File.open(file_name, 'r') do |f|

				# Read all the data
				raw_data = ""
				f.each_line { |line| raw_data << line }
			end
		else

			# If it doesn't exist, warn the server and return nil - effectively removing the object
			Debug.add("[WARNING] #{id}.json not found")
		end

		return raw_data
	end
end
