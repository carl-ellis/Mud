#!/usr/bin/env ruby
require 'json'
require 'json_serialisable'

# JSON storage functions
class Room

	# Create the constructor JSON can work with
	# Can't use the automatic ones here due for flexibility needed
	def to_json(*a)
		{
			'json_class' 		=>	self.class.name,
			'id'						=>	@id,
			'name'					=> 	@name,
			'desc'					=> 	@desc,
			'flags'					=> 	@flags,
			'items'					=>	@items,
			'mobs'					=>	@mobs,
			'players'				=>	@players,
			'exits' 				=>	Hash[@exits.collect { |k,v| [k, v.id]}],
			'doors' 				=>	Hash[@doors.collect { |k,v| [k, v.state]}]
		}.to_json(*a)
	end

	def self.json_create(o)
		new(o['id'], o['name'], o['desc'], o['flags'], o['items'], o['mobs'], o['players'], o['exits'], o['doors'])
	end

	# Collect other objects which are likely to be used
	def cache_collect

		@items.each { |i|	Repository.repo.get_from_cache(i) }
		@mobs.each { |m|	Repository.repo.get_from_cache(m) }
		@exits = Hash[@exits.collect{ |k,v| [k.to_i, v]}]
		@doors = Hash[@doors.collect{ |k,v| [k.to_i, Door.new(v)]}]

	end
	
end
