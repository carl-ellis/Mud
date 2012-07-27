# This handles all of the JSON deserialisation and storage methods
#
# 1. Should manage where the data directory is (THIS SHOULD BE SET BY THE CONFIGURATION)
#
# 2. Should retreive files from the data directory and deserialise them.
#    - Some objects may require their dependencies deserialised too
class Repository

	@checked_classes

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

		# Escape if object not found
		return nil if raw.nil?

		# Create object
		obj = JSON::parse(raw)

		# Grab needed objects, args => self
		obj.cache_collect

		# return
		return obj
	end

	# Overloaded method from repository
	# Saves an object to storage
	# Arguments:
	#   obj = Object
	def save_to_storage(obj)
		raise "[FATAL] Storage directory not set" if Repository.data_dir.nil?

		# Build a white list for classes if doesn't exist
		@checked_classes = [] if @checked_classes.nil?

		# Check the object has a sane to_json defined
		if !@checked_classes.include?(obj.class.name)
			begin
				JSON::parse(obj.to_json)
				@checked_classes << obj.class.name
			rescue
				raise "[FATAL] Object cannot be stored, to_json method not defined"
			end
		end
			

		write_raw(obj)
	end

	# Overloaded method from repository
	# Removes an object to storage
	# Arguments:
	#   id = Object id
	def remove_from_storage(id)
		raise "[FATAL] Storage directory not set" if Repository.data_dir.nil?

		remove_file(id)
	end


private

  # Given an object, write out the json file
  def write_raw(obj)

    # To write
    raw_data = obj.to_json

    # File name
    file_name = "#{Repository.data_dir}#{obj.id}.json"

    File.open(file_name, 'w') do |f|
      f.puts(raw_data)
    end
  end

  # Given an id, remove the json file
  def remove_file(id)

    # Get file name
    file_name = "#{Repository.data_dir}#{id}.json"

		# Check if file exists
		if File.exists?(file_name)
			# if so delete
			File.delete(file_name)
		else
			Debug.add("[WARNING] #{id}.json not found")
		end
  end

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
