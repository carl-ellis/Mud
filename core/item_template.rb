#!/usr/bin/env ruby
require './core/template.rb'

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
