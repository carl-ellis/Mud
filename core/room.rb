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
	# exits		->	A hash of the exits and the connecting rooms
	# doors		->	A hash of the door types corresponding to the connecting rooms
	attr_accessor :id, :name, :desc, :flags, :items, :mobs, :players, :exits, :doors

	# Default Constructor 
	def initialize(id, name, desc, flags, items, mobs, players, exits, doors)

		# Check types
    raise unless id.is_a?(Fixnum)
    raise unless name.is_a?(String)
    raise unless desc.is_a?(String)
    raise unless flags.is_a?(Numeric)
    raise unless items.is_a?(Array)
    raise unless mobs.is_a?(Array)
    raise unless players.is_a?(Array)
    raise unless exits.is_a?(Hash)
    raise unless doors.is_a?(Hash)

		@id 			= id
		@name 		= name
		@desc 		= desc
		@flags 		= flags
		@items 		= items
		@mobs 		= mobs
		@players	=	players
		@exits		= exits
		@doors		= doors
	end

	# Connects two rooms together
	def connect(roomid, direction, door)

		# Check types
		raise unless roomid.is_a?(Fixnum)
		raise unless direction.is_a?(Fixnum)
		raise unless door.is_a?(Door)

		# Check not connecting with self
		raise unless self.id != roomid

		room = Repository.get(roomid)
		
		# Check object is a room
		self.exits[direction] = room.id
		self.doors[direction] = door

		room.exits[Direction::opposite(direction)] = self.id
		room.doors[Direction::opposite(direction)] = door
	end
end
