#!/usr/bin/env ruby

# The set of stats used in the game
class Statset
	
	# id 			-> 	set id
	# stats 	->	Array of stat names, must be labels
	attr_accessor :id, :stats

	# Default Constructor
	def initialize(id, stats)

		# ensure correct types are used
		raise unless id.is_a?(Fixnum)
		raise unless stats.is_a?(Array)
		raise unless !stats.empty?
		stats.each { |s| raise unless s.is_a?(Symbol) }

		@id 			= id
		@stats  	= stats
	end
end
