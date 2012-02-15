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
			'items'					=>	@items.collect { |i| i.id },
			'mobs'					=>	@mobs.collect { |m| m.id },
			'players'				=>	@players.collect { |p| p.id },
			'exits' 				=>	Hash[@exits.collect { |k,v| [k, v.id]}],
			'doors' 				=>	Hash[@doors.collect { |k,v| [k, v.state]}]
		}.to_json(*a)
	end

	def self.json_create(o)
		new(o['id'], o['name'], o['desc'], o['flags'], o['items'], o['mobs'], o['players'], o['exits'], o['doors'])
	end

	# Collect over objects which need to be deserialised
	# 
  # Arguments:
	#  repo: Repository in which to retrieve objects
	def collect(repo)

		@items.collect!{ |item| repo.get(item)}
		@mobs.collect!{ |mob| repo.get(mob)}
		#TODO when implimented
    #@players.collect!{ |item| r.get(item)}
		@exits = Hash[@exits.collect{ |k,v| [k.to_i, v]}]
		@doors = Hash[@doors.collect{ |k,v| [k.to_i, Door.new(v)]}]

		# Room connections should be handled by the area due to dependencies

	end
	
end
