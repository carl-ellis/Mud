#!/usr/bin/env ruby
require 'json'
require 'json_serialisable'

# JSON storage functions
class Mob

  attr_serialise :id, :hp, :template

	def self.json_create(o)
		new(o['id'], o['hp'], o['template'])
	end

	# Collect other objects which are likely to be used
	def cache_collect
		Repository.repo.get_from_cache(@template)
	end

end
