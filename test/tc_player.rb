require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class PlayerTest < Test::Unit::TestCase

	def setup()

	end

	# Checks that arguments are rejected if they're wrong
	def test_typecheck
		assert_raise( RuntimeError ) { Player.new("1", "2", "3", "4", 5, 6, 7, {}, 9, []) }
		assert_raise( RuntimeError ) { Player.new(1, 2, "3", "4", 5, 6, 7, {}, 9, []) }
		assert_raise( RuntimeError ) { Player.new(1, "2", 3, "4", 5, 6, 7, {}, 9, []) }
		assert_raise( RuntimeError ) { Player.new(1, "2", "3", 4, 5, 6, 7, {}, 9, []) }
		assert_raise( RuntimeError ) { Player.new(1, "2", "3", "4", "5", 6, 7, {}, 9, []) }
		assert_raise( RuntimeError ) { Player.new(1, "2", "3", "4", 5, "6", 7, {}, 9, []) }
		assert_raise( RuntimeError ) { Player.new(1, "2", "3", "4", 5, 6, "7", {}, 9, []) }
		assert_raise( RuntimeError ) { Player.new(1, "2", "3", "4", 5, 6, 7, "{}", 9, []) }
		assert_raise( RuntimeError ) { Player.new(1, "2", "3", "4", 5, 6, 7, {}, "9", []) }
		assert_raise( RuntimeError ) { Player.new(1, "2", "3", "4", 5, 6, 7, {}, 9, "[]") }
	end

end
