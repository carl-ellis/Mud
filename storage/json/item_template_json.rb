#!/usr/bin/env ruby
require 'json'
require 'json_serialisable'

# JSON storage functions
class ItemTemplate

	# Create the JSON functions
	attr_serialise :id, :name, :desc, :weight

	# Collect over objects which need to be deserialised
	# 
  # Arguments:
	#  repo: Repository in which to retrieve objects
	def collect(repo)
	end
end
