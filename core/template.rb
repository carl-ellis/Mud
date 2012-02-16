#!/usr/bin/env ruby

# A general game template
class Template

	# id			-> template id
	# name		-> template name
	# desc		-> template description
	attr_accessor :id, :name, :desc

	# default constructor
	def initialize(id, name, desc)

		# Check types
		raise unless id.is_a?(Fixnum)
		raise unless name.is_a?(String)
		raise unless desc.is_a?(String)

		@id = id
		@name = name
		@desc = desc
	end
end
