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

	# Collect over objects which need to be deserialised
	# 
  # Arguments:
	#  repo: Repository in which to retrieve objects
	def collect(repo)
		@rooms.collect!{ |id| repo.get(id) }

		# Connect rooms together
		rooms.each do |room|
			room.exits.each do |direction, rid|
				room.connect(repo.get(rid), direction, room.doors[direction]) if rid.class == Fixnum
			end
		end
	end

end
