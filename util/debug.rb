# Handles debug output
class Debug

	class << self

		# If this is on, debug works
		attr_accessor :debug_on
		
	end

	# Print a message to STDOUT
	def self.add(message)
		puts message if Debug.debug_on
	end
	  
end
