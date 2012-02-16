require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class DirectionTest < Test::Unit::TestCase

	def setup()
		Configuration.configure_using_options(Options)
	end

	# Checks that arguments are rejected if they're wrong
	def test_typecheck
		assert_raise( RuntimeError ) { Direction.opposite("1") }
	end

	# Checks that the arguments are in bounds
	def test_boundscheck
		assert_raise( RuntimeError ) { Direction.opposite(-1) }
	end

	# Checks opposite functionality
	def test_opposite
		message = "Directions are not opposite each other"
		assert_equal(Direction::NORTH, Direction.opposite(Direction::SOUTH), message) 
		assert_equal(Direction::NORTHEAST, Direction.opposite(Direction::SOUTHWEST), message) 
		assert_equal(Direction::EAST, Direction.opposite(Direction::WEST), message) 
		assert_equal(Direction::SOUTHEAST, Direction.opposite(Direction::NORTHWEST), message) 
		assert_equal(Direction::UP, Direction.opposite(Direction::DOWN), message) 
	end
end
