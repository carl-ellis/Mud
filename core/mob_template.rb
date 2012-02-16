#!/usr/bin/env ruby

# A template for a mob in the game
class MobTemplate < Template

	# max_health	-> template max health
	attr_accessor :max_health

	# default constructor
	def initialize(id, name, desc, max_health)
		super(id, name, desc)

		# Type Check
		raise unless max_health.is_a?(Numeric)

		@max_health = max_health
	end
end
