# Handles configuring requirements
class Configuration

	class << self
		attr_accessor :opts
	end

  # Handles requirements based on options
	def self.configure_using_options(options)

		Configuration.opts = options

		require_libs()
		require_core()
		require_storage()
		case options.storage
		  when :json
				require_json()
		end
		require_utils()
		
	end

	# Requires core classes
	def self.require_core
		require './core/direction.rb'
		require './core/door.rb'
		require './core/template.rb'
		require './core/item_template.rb'
		require './core/item.rb'
		require './core/mob_template.rb'
		require './core/mob.rb'
		require './core/room.rb'
		require './core/area.rb'
		require './core/player.rb'
		require './core/player_manager.rb'
		require './core/statset.rb'
	end

	# Requires libraries
	def self.require_libs
		require 'json'
		require 'json_serialisable'
		require 'rake'
		require 'bcrypt'
	end

	# Require default storage classes
	def self.require_storage
		require './storage/repository.rb'
		require './storage/freeid.rb'
	end

	def self.require_utils
		require './util/debug.rb'
		Debug.debug_on = Configuration.opts.debug
		require './util/password.rb'
	end

	##OPTIONS
	def self.require_json
		require './storage/json/area_json.rb'
		require './storage/json/door_json.rb'
		require './storage/json/item_json.rb'
		require './storage/json/item_template_json.rb'
		require './storage/json/mob_json.rb'
		require './storage/json/mob_template_json.rb'
		require './storage/json/room_json.rb'
		require './storage/json/repository_json.rb'
		Repository.data_dir = Configuration.opts.storage_options[:data_dir]
		require './storage/json/freeid_json.rb'
		require './storage/json/player_manager_json.rb'
	end
end
