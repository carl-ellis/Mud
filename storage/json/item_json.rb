#!/usr/bin/env ruby
require 'json'
require 'json_serialisable'

# JSON storage functions
class Item

	# Create the JSON functions
	# Can't use the automatic ones here due for flexibility needed
	def to_json(*a)
		{
			'json_class' 		=>	self.class.name,
			'id'						=>	@id,
			'wear'					=> 	@wear,
			'template'			=>	@template.id
		}.to_json(*a)
	end

	def self.json_create(o)
		new(o['id'], o['wear'], o['template'])
	end

	# Collect over objects which need to be deserialised
	# 
  # Arguments:
	#  repo: Repository in which to retrieve objects
	def collect(repo)
		@template = repo.get(@template)
	end

end
