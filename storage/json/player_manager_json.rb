#!/usr/bin/env ruby
require 'json'
require 'json_serialisable'

# JSON storage functions
class PlayerManager


  attr_serialise :id, :player_list

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
