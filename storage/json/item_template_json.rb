#!/usr/bin/env ruby
require 'json'
require './lib/jserialisable'

# JSON storage functions
class ItemTemplate

	# Create the JSON functions
	attr_serialise :id, :name, :desc, :weight
end
