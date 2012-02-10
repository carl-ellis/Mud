# This class handles serialising and deserialing objects so they can be used the game
# Main jobs:
#
#   Reading objects from their serialised forms and recreating ruby objects from them
#     - From this converting any ids into actual object references
#		  * This functionality should ideally be handles by a subclass which 
#       manages the deserialisation for different storage types (e.g. json, sql)
#
# 	Caching often read objects
#     - Should be a simple queue where used items are put at the front of the queue
#     * Initially, every object in an area should be cached, this may change with 
#       development
#
#   Simple API for getting objects
#     - GetRoom, GetArea, GetID, etc etc
#
#    Simple API for creating objects
#     - CreateRoom, CreateArea, FreeID, etc, etc
#     * IDs should be unique across everything, so free ids should be tracked
class Repository

	# Cache
	@cache_size = 0
	@cache   = []

	# Constructor
	def initialize(cache_size)
		@cache, @cache_size = [], cache_size
	end

	# Gets an item from the cache, or if not there, gets via storage method
  # Arguments:
	#   id  = Object id
  #
  # Returns:
	#   obj = Object
	def get_from_cache(id)
		
		# Check cache
		obj = nil
		@cache.each{ |o| obj = o if o.id == id }

		# get from storage if not in the cache
		obj = get_from_storage(id) if obj.nil?

		return obj
	end

	# Virtual method - Should be overridden my storage class
	# Gets an object from storage
  # Arguments:
	#   id  = Object id
  #
  # Returns:
	#   obj = Object
	def get_from_storage(id)
		raise "[FATAL] Storage model must be used"
	end
end

