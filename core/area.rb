#!/usr/bin/env ruby

# An area is a collection of rooms - helpful for admin
class Area
	
	# id 		-> 	area id
	# name 	->	area name
	# rooms	->	rooms in the area
	attr_accessor :id, :name, :rooms

	# Default Constructor
	def initialize(id, name, rooms)
		@id 		= id
		@name 	= name
		@rooms 	= rooms
	end
end
