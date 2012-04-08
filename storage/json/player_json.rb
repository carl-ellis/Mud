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
	attr_serialise :id, :name, :hash, :salt, :hp, :mp, :classtype, :stats, :room, :inv

  def cache_collect
    Repository.repo.get_from_cache(@room)
  end

	# Return true if the id is in use by this object
	# Arguments:
	#		id		Id of object to check for
	def garbage_check(id)
	 return room == id || inv.include?(id)
	end


end
