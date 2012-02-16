#!/usr/bin/env ruby
require 'json'
require 'json_serialisable'

# JSON storage functions
class ItemTemplate

	# Create the JSON functions
	attr_serialise :id, :name, :desc, :weight

	# Collect other objects which are likely to be used
	def cache_collect
	end
end
