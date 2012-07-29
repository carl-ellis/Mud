require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class PClassTest < Test::Unit::TestCase

	def setup()

	end

	# Checks that arguments are rejected if they're wrong
	def test_typecheck
		assert_raise( RuntimeError ) { PClass.new("1", "2", "3", []) }
		assert_raise( RuntimeError ) { PClass.new(1, 2, "3", []) }
		assert_raise( RuntimeError ) { PClass.new(1, "2", 3, []) }
		assert_raise( RuntimeError ) { PClass.new(1, "2", "3", "[]") }
	end

end
