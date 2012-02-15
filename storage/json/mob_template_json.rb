#!/usr/bin/env ruby
require 'json'
require 'json_serialisable'

# JSON storage functions
class MobTemplate 

	# Create the JSON functions
	attr_serialise :id, :name, :desc, :max_health

	# Collect over objects which need to be deserialised
	# 
  # Arguments:
	#  repo: Repository in which to retrieve objects
	def collect(repo)
	end

end
