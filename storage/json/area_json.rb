#!/usr/bin/env ruby
require 'json'
require 'json_serialisable'

# JSON storage functions
class Area

	# Create the JSON functions
	# Can't use the automatic ones here due for flexibility needed
	def to_json(*a)
		{
			'json_class' 		=>	self.class.name,
			'id'						=>	@id,
			'name'					=> 	@name,
			'rooms'					=>	@rooms.collect { |r| r.id }
		}.to_json(*a)
	end

	def self.json_create(o)
		new(o['id'], o['name'], o['rooms'])
	end

	# Collect other objects which are likely to be used
	def cache_collect
		@rooms.each{ |rid| Repository.get(rid) }
	end

end
