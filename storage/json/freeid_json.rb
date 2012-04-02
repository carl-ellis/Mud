# This handles all of the JSON Free Id tracking
#
# 1. Should retreive freeids by tracking the data_dir
class FreeId

attr_serialise :id, :extras, :last

	# Given a data directory, work out free ids
	def self.from_dir(data_dir)

		raise unless data_dir.is_a?(String)
    raise unless File.exists?(data_dir)

		# Get ids
		ids = FreeId.get_ids(data_dir)

		# Get last id, and work out stranglers
		last = ids.max + 1
		ideal = []; last.times { |i| ideal << i }
		extras = ideal - ids

		# Fill the freeid object up, and give it the next available id
		freeid = FreeId.new(0, extras, last)
		# Bit of a hack to get around the protected variables
		freeid = FreeId.new(freeid.next, extras, last)
		return freeid

	end


private

	# Get all the ids of JSON files in a given directory
	def self.get_ids(data_dir)
		
    ids = []

		# search str
		search_str = "#{data_dir}*.json"

		Dir.glob(search_str).each{ |f| ids << f.gsub("#{data_dir}", "").gsub(".json","").to_i }
		
		return ids
	end
end
