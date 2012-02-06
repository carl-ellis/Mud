#!/usr/bin/env ruby

# Defines the different types of door, namely clear, open, and closed
class Door
	
	# A clear entryway
	CLEAR = 0
	# An open door
	OPEN = 1
	# A closed door
	CLOSE = 2

	# Any value over 2 is a lock id for the key needed to open it
	attr_accessor :state
	
	def initialize(state)
		@state = state
	end

end
