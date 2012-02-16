require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class AreaTest < Test::Unit::TestCase

	def setup()
		Configuration.configure_using_options(Options)
	end

	# Checks that arguments are rejected if they're wrong
	def test_typecheck
		assert_raise( RuntimeError ) { Area.new("1", "test", []) }
		assert_raise( RuntimeError ) { Area.new(1, 2, []) }
		assert_raise( RuntimeError ) { Area.new(1, "test", 3) }
	end
end
