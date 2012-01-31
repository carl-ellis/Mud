#!/usr/bin/env ruby
require 'json'
require './lib/jserialisable'

# JSON storage functions
class Mob

	# Create the JSON functions
	# Can't use the automatic ones here due for flexibility needed
	def to_json(*a)
		{
			'json_class' 		=>	self.class.name,
			'id'						=>	@id,
			'hp'						=> 	@hp,
			'template'			=>	@template.id
		}.to_json(*a)
	end

	def self.json_create(o)
		new(*o['id'], *o['hp'], *o['template'])
	end
end
