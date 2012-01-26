#!/usr/bin/env ruby

# A mob in the game
class Mob

	# id 				-> mob instance id
	# hp 				-> mob instance hp
	# template 	-> mob template
	attr_accessor :id, :hp, :template

	# Default constructor
	def initialize(id, hp, template)
		@id = id
		@hp = hp
		@template = template
	end
end
