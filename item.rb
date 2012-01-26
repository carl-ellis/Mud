#!/usr/bin/env ruby

# An instance of  an item in the game
class Item

	# id				-> 	item instance id
	# hp				->  item health
	#	template  ->	item template
	attr_accessor :id, :hp

	# Default constructor
	def initialize(id, hp, template)
		@id = id
		@hp = hp
		@template	= template
	end
end
