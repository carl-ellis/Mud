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

	# Return true if the id is in use by this object
	# Arguments:
	#		id		Id of object to check for
	def garbage_check(id)
	 return false
	end
end
