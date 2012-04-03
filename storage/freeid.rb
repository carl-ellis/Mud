# This class handles freeid tracking in the repository
# Main jobs:
#
#   Can start from scratch, and essentially holds a number to increment
#   Can be passed a data_dir and it will brute force the files to find freeid gaps
#
#    Simple API for tracking frees
#     - next
#			- add
class FreeId

  # Id of this object (Should be the only one ever set by hand)
	@id = 0;

  # Out of orders
  @extras = []

	#last id used
	@last = 1

	# Constructor
	def initialize(id, extras, last)
		
		# Check types
		raise unless id.is_a?(Fixnum)
		raise unless extras.is_a?(Array)
		raise unless last.is_a?(Fixnum)

		@id, @extras, @last = id,extras, last
	end

	# Gets the next id
	def next
		# Use up all of the extras
		return @extras.pop if !@extras.empty?
		# Then track the last freeid used (which should always be the max)
		return (@last+=1)-1
	end

	# Adds an id to the extras list
	def add(id)
		raise unless id.is_a?(Fixnum)
		@extras << id
	end

  # Accessor method
  def id
    @id
  end

end

