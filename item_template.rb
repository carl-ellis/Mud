#!/usr/bin/env ruby

# A template for an item in the game
class ItemTemplate < Template

	# weight  -> template weight
	attr_accessor :weight

	# default constructor
	def initialize(id, name, desc, weight)
		super(id, name, desc)
		@weight = weight
	end
end
