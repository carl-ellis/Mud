# Handles configuring requirements
class Configuration

  # Handles requirements based on options
	def self.configure_using_options(options)

		require_libs()
		require_core()
		require_storage()
		case options.storage
		  when :json
				require_json()
		end
		
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
	end

	# Requires libraries
	def self.require_libs
		require 'json'
		require 'json_serialisable'
	end

	# Require default storage classes
	def self.require_storage
		require './storage/repository.rb'
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
	end
end
