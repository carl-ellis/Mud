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

  # Active objects
  @actives = []

	# Cache
	@cache_size = 0
	@cache   = []
	@cache_ptr = 0

	@@repo = nil

  # FreeId tracker object
  @freeid

	# Constructor
	def initialize(cache_size)
		@cache, @cache_size, @cache_ptr = [], cache_size, 0
    @actives = []
		@@repo = self
    @freeid = nil
	end

  # Accessor
  def actives
    @actives
  end

  # A nice API for getting objects
	#
	# Arguments:
	#   id: Object id
	def self.get(id)
    obj = @@repo.get_from_cache(id)
    @@repo.actives << obj
    Debug.add("[+ACTIVE] #{id} of type #{obj.class.name}")
    return obj
	end

  # A nice API for saving objects
  #
  # Arguments:
  #   id: Object id
  def self.save(id)
    obj = @@repo.get_active(id)
    @@repo.save_to_storage(obj)
    Debug.add("[-ACTIVE] #{id} of type #{obj.class.name}")
    @@repo.update_cache(id)
  end

  # A nice API for creating hard objects
  # Assigns the obj and ID and saves to the repository
  #
  # Arguments:
  #   obj: Object
  #
  # Returns
  #  Object id
  def self.create(obj)
    
    # Check that the obj has an id method
    raise unless obj.class.public_method_defined?("id")

    # Assign ID
    id = @@repo.next_id
    obj.id = id
              
    # Save and cache
    @@repo.save_to_storage(obj)
    Debug.add("[++CREATE] #{id} of type #{obj.class.name}")
    self.get(id)

    # Return ID
    return id
  end

  # A nice API for removing hard objects
  # Gets the id and checks that nothing reference it. then deletes the datafile
  #
  # Arguments:
  #   id: Object id
  #
  # Returns
  #   If deleted or not
  def self.delete(id)
    
    # Check to see if it is garbagable
		return false if @@repo.garbage_check(id)

    # Save and cache
    @@repo.remove_from_storage(id)
    @@repo.remove_from_cache(id)

		# Recycle id
    Debug.add("[--DELETE] #{id}")

    # Return ID
    return true
  end

  # Gets the Singleton Repo object
	def self.repo
		raise unless !@@repo.nil?
		@@repo
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
		@cache.each{ |o| obj = o if !o.nil? && o.id == id }

		# Manage last used first position cache here
		if obj.nil?
			# get from storage if not in the cache
			obj = get_from_storage(id)
			Debug.add("[STORAGE] Got #{id} of type #{obj.class.name}")
      add_to_cache(obj)
		else
			Debug.add("[CACHE] Got #{id} of type #{obj.class.name}")
			shift_in_cache(obj)
		end

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

	# Virtual method - Should be overridden my storage class
	# Saves an object to storage
  # Arguments:
	#   obj = Object
	def save_to_storage(obj)
		raise "[FATAL] Storage model must be used"
	end

	# Virtual method - Should be overridden my storage class
	# Removes an object to storage
  # Arguments:
	#   id = Object id
	def remove_to_storage(id)
		raise "[FATAL] Storage model must be used"
	end

  # Gets an object from the active list
  def get_active(id)
    obj = @actives.find { |o| !o.nil? && o.id == id}
    obj
  end

	# Adds an object to the head of the cache
	def add_to_cache(obj)
		@cache[@cache_ptr] = obj
		@cache_ptr += 1
		@cache_ptr %= @cache_size
	end

	# Moves an object to the head of the cache
	def shift_in_cache(obj)
		ind = @cache.index(obj)
		if !ind.nil? && ind < @cache_ptr 
			@cache_ptr -= 1
			@cache_ptr %= @cache_size
		end
		add_to_cache(obj)
	end

  # Updates cache from the active list and removes from the active list
  def update_cache(id)
    
    # Delete from the active queue
    obj = @actives.find { |i| i.id == id}
    @actives.delete(obj)

    # Update in the cach and place in front
    @cache.collect do |o|
      if o.id == id
        obj
      else
        o
      end
    end
    shift_in_cache(obj)
  end

	# Remove an object from the cache
	# Arguments:
	#		id: 	id to remove
	def remove_from_cache(id)
		ind = -1
		(0...@cache.length). each{ |i| ind = i if @cache[i].id == id }
		@cache[ind] = nil
	end

  # Sets the Freeid object
  # Arguments:
  #   id      Id of freeid tracer object
  def freeid(id)

    # Get object
    obj = Repository.get(id)

    # Check if the correct type
    raise unless obj.is_a?(FreeId)

    # Set object
    @freeid = obj

    # Set a destructor to make sure freeid is saved
    ObjectSpace.define_finalizer(self, proc { Repository.save(id) })

  end

  # Returns a freeid
  def next_id()
		raise "[FATAL] Id tracking must be used" unless !@freeid.nil?
    return @freeid.next
  end

	# Checks every object to see if it references an ID
	# Prerequisite to deletion
	# Arguments:
	#		id			Id of object to check for
	def garbage_check(id)
		found = false
		get_all_ids.each do |i| 

			# Get obj
			obj = Repository.repo.get_from_cache(i)

			# Check for links
			if obj.garbage_check(id) 
				found = true
			end
		end

		# Ensure current obj is still in the cache
		Repository.get(id)
		return found
	end

	# Gets the id of every object in the repo
	def get_all_ids
		raise "[FATAL] Id tracking must be used" unless !@freeid.nil?

		# Create a list of all possible ids
		raw = []
		0.upto(@freeid.last-1).each { |i| raw << i}

		# Remove the gaps
		ids = raw - @freeid.extras

		return ids
	end

end

