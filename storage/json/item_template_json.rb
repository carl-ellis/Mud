#!/usr/bin/env ruby
require 'json'
require 'json_serialisable'

# JSON storage functions
class ItemTemplate

	# Create the JSON functions
	attr_serialise :id, :name, :desc, :weight
end
