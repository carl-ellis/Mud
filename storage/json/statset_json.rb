#!/usr/bin/env ruby
require 'json'
require 'json_serialisable'

# JSON storage functions
class Statset

  attr_serialise :id, :stats

	# symbols need converting
	def self.json_create(o)
		new(o['id'], o['stats'].collect { |a| a.to_sym})
	end

	# Collect other objects which are likely to be used
	def cache_collect
	end

	# Return true if the id is in use by this object
	# Arguments:
	#		id		Id of object to check for
	def garbage_check(id)
	 return @id == id
	end

end
