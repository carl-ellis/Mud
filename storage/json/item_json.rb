#!/usr/bin/env ruby
require 'json'
require 'json_serialisable'

# JSON storage functions
class Item

  attr_serialise :id, :wear, :template

	def self.json_create(o)
		new(o['id'], o['wear'], o['template'])
	end

	# Collect other objects which are likely to be used
	def cache_collect
		Repository.repo.get_from_cache(@template)
	end

	# Return true if the id is in use by this object
	# Arguments:
	#		id		Id of object to check for
	def garbage_check(id)
	 return @template == id
	end
end
