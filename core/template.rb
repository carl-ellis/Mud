#!/usr/bin/env ruby

# A general game template
class Template

	# id			-> template id
	# name		-> template name
	# desc		-> template description
	attr_accessor :id, :name, :desc

	# default constructor
	def initialize(id, name, desc)
		@id = id
		@name = name
		@desc = desc
	end

	# String output
	def to_s
		return "#{@id}"
	end

end
