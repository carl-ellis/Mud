require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class ItemTest < Test::Unit::TestCase

	def setup()
		Configuration.configure_using_options(Options)
	end

	# Checks that arguments are rejected if they're wrong
	def test_typecheck
		assert_raise( RuntimeError ) { Item.new("1", 2.0, 3) }
		assert_raise( RuntimeError ) { Item.new(1, "2.0", 3) }
		assert_raise( RuntimeError ) { Item.new(1, 2.0, "3") }
	end

end
