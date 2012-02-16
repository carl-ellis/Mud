require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class RoomTest < Test::Unit::TestCase

	@room
	@room2

	def setup()
		Configuration.configure_using_options(Options)
		Repository.new(10)
		@room = Room.new(1, "2", "3", 4, [], [], [], {}, {})
		@room2 = Room.new(2, "2", "3", 4, [], [], [], {}, {})
		Repository.repo.add_to_cache(@room)
		Repository.repo.add_to_cache(@room2)
	end

	# Checks that arguments are rejected if they're wrong
	def test_typecheck
		assert_raise( RuntimeError ) { Room.new("1", "2", "3", 4, [], [], [], {}, {}) }
		assert_raise( RuntimeError ) { Room.new(1, 2, "3", 4, [], [], [], {}, {}) }
		assert_raise( RuntimeError ) { Room.new(1, "2", 3, 4, [], [], [], {}, {}) }
		assert_raise( RuntimeError ) { Room.new(1, "2", "3", "4", [], [], [], {}, {}) }
		assert_raise( RuntimeError ) { Room.new(1, "2", "3", 4, {}, [], [], {}, {}) }
		assert_raise( RuntimeError ) { Room.new(1, "2", "3", 4, [], {}, [], {}, {}) }
		assert_raise( RuntimeError ) { Room.new(1, "2", "3", 4, [], [], {}, {}, {}) }
		assert_raise( RuntimeError ) { Room.new(1, "2", "3", 4, [], [], [], [], {}) }
		assert_raise( RuntimeError ) { Room.new(1, "2", "3", 4, [], [], [], {}, []) }
		assert_raise( RuntimeError ) { @room.connect("2", Direction::NORTH, Door.new(0)) }
		assert_raise( RuntimeError ) { @room.connect(2, "Direction::NORTH", Door.new(0)) }
		assert_raise( RuntimeError ) { @room.connect(2, Direction::NORTH, "Door.new(0)") }
	end

	# Checks that the arguments are in bounds
	def test_noneuclideon
		assert_raise( RuntimeError ) { @room.connect(1, Direction::NORTH, Door.new(0)) }
	end

	# Checks opposite functionality
	def test_opposite
		@room.connect(@room2.id, Direction::NORTH, Door.new(0))

		message = "Rooms are not opposite each other"
		assert_equal(@room.exits[Direction::NORTH], @room2.id, message) 
		assert_equal(@room2.exits[Direction.opposite(Direction::NORTH)], @room.id, message) 
	end
end
