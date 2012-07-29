#!/usr/bin/env ruby

# A Player Class
class PClass

	# id			-> 	class id
	# name		->	class name
	# desc		->	class desc
	# skills	-> 	skills
	attr_serialise :id, :name, :desc, :skills

  def cache_collect
    Repository.repo.get_from_cache(@skills)
  end

	# Return true if the id is in use by this object
	# Arguments:
	#		id		Id of object to check for
	def garbage_check(id)
	 return @skills.include?(id)
	end


end
