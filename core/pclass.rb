#!/usr/bin/env ruby

# A Player Class
class PClass

	# id			-> 	class id
	# name		->	class name
	# desc		->	class desc hash
  # skills  ->  class skills
	attr_accessor :id, :name, :desc, :skills 

	# Default Constructor 
	def initialize(id, name, desc, skills)

		# Check types
    raise unless id.is_a?(Fixnum)
    raise unless name.is_a?(String)
    raise unless desc.is_a?(String)
    raise unless skills.is_a?(Array)

		@id 			  = id
		@name 		  = name
		@desc 		  = desc
		@skills		  = skills
	end
end
