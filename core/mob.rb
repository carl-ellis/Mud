#!/usr/bin/env ruby

# A mob in the game
class Mob

	# id 				-> mob instance id
	# hp 				-> mob instance hp
	# template 	-> mob template
	attr_accessor :id, :hp, :template

	# Default constructor
	def initialize(id, hp, template)

		# Check types
		raise unless id.is_a?(Fixnum)
		raise unless hp.is_a?(Numeric)
		raise unless template.is_a?(Fixnum)

		@id = id
		@hp = hp
		@template = template
	end
end
