#!/usr/bin/env ruby
require 'json'
require 'json_serialisable'

# JSON storage functions
class Door

	# Create the JSON functions
	attr_serialise :state

	# Collect other objects which are likely to be used
	def cache_collect
	end

end
