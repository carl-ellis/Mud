#!/usr/bin/env ruby

# The set of skills used in the game
class Skillset
	
	# id 			-> 	set id
	# skills 	->	Array of skill names, must be labels
	attr_accessor :id, :skills

	# Default Constructor
	def initialize(id, skills)

		# ensure correct types are used
		raise unless id.is_a?(Fixnum)
		raise unless skills.is_a?(Array)
		raise unless !skills.empty?
		skills.each { |s| raise unless s.is_a?(Symbol) }

		@id 			= id
		@skills 	= skills
	end
end
