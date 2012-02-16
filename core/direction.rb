#!/usr/bin/env ruby

# Describes directions of room connections
class Direction

	NORTH		= 0
	NORTHEAST 	= 1
	EAST		= 2
	SOUTHEAST	= 3
	UP		= 4
	SOUTH		= 5
	SOUTHWEST 	= 6
	WEST		= 7
	NORTHWEST	= 8
	DOWN		= 9

	# Method for easily getting the reverse direction
	def self.opposite(dir)

		# Type check
		raise unless dir.is_a?(Fixnum)
		
		# Bounds check
		raise unless dir >= 0 && dir <10

		if dir < 5
			dir + 5
		else
			dir - 5
		end
	end
end
