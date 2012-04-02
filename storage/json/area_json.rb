#!/usr/bin/env ruby
require 'json'
require 'json_serialisable'

# JSON storage functions
class Area


  attr_serialise :id, :name, :rooms

	# Collect other objects which are likely to be used
	def cache_collect
		@rooms.each{ |rid| Repository.repo.get_from_cache(rid) }
	end

end
