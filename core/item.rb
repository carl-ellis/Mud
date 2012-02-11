#!/usr/bin/env ruby

# An instance of  an item in the game
class Item

	# id				-> 	item instance id
	# wear			->  item wear
	#	template  ->	item template
	attr_accessor :id, :hp

	# Default constructor
	def initialize(id, wear, template)
		@id = id
		@wear = wear
		@template	= template
	end
end
