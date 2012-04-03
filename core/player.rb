#!/usr/bin/env ruby

# A player
class Player

	# id			-> 	player id
	# name		->	player name
	# hash		->	password hash
	# salt		-> 	password salt
  # hp  		->	current hp 
  # mp  		->	current mp 
  # class   ->  player class
	# stats	  ->	player stats hash
	# room		->	current room
	# inv	    ->	Inventory 
	attr_accessor :id, :name, :hash, :salt, :hp, :mp, :classtype, :stats, :room, :inv

	# Default Constructor 
	def initialize(id, name, hash, salt, hp, mp, classtype, stats, room, inv)

		# Check types
    raise unless id.is_a?(Fixnum)
    raise unless name.is_a?(String)
    raise unless hash.is_a?(String)
    raise unless salt.is_a?(String)
    raise unless hp.is_a?(Fixnum)
    raise unless mp.is_a?(Fixnum)
    raise unless classtype.is_a?(Fixnum)
    raise unless stats.is_a?(Hash)
    raise unless room.is_a?(Fixnum)
    raise unless inv.is_a?(Array)

		@id 			  = id
		@name 		  = name
		@hash 		  = hash
		@salt 		  = salt
		@hp 		    = hp
		@mp 		    = mp
		@classtype	=	classtype
		@stats		  = stats
		@room		    = room
		@inv		    = inv
	end
end
