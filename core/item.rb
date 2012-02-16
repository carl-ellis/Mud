#!/usr/bin/env ruby

# An instance of  an item in the game
class Item

	# id				-> 	item instance id
	# wear			->  item wear
	#	template  ->	item template
	attr_accessor :id, :wear, :template

	# Default constructor
	def initialize(id, wear, template)

		# Type checks
		raise unless id.is_a?(Fixnum)
		raise unless wear.is_a?(Numeric)
		raise unless template.is_a?(Fixnum)

		@id = id
		@wear = wear
		@template	= template
	end
end
