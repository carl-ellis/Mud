#!/usr/bin/env ruby

# A room in the game
class Room

	# Room flags

	ROOM_SAFE_AREA 	= 0x01
	ROOM_DEATH_TRAP = 0x02
	
	# id			-> 	room id
	# name		->	room name
	# desc		->	room description
	# flags		->	room flags
	# items		-> 	items in the room
	# mobs		->	mobs in the room
	# players	->	players in the room
	attr_accessor :id, :name, :desc, :flags, :items, :mobs, :players

	# Default Constructor 
	def initialize(id, name, desc, flags, items, mobs, players)
		@id 			= id
		@name 		= name
		@desc 		= desc
		@flags 		= flags
		@items 		= items
		@mobs 		= mobs
		@players	=	players
	end
end
