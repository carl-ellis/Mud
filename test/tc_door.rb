require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class DoorTest < Test::Unit::TestCase

	def setup()
		Configuration.configure_using_options(Options)
	end

	# Checks that arguments are rejected if they're wrong
	def test_typecheck
		assert_raise( RuntimeError ) { Door.new("1") }
	end

	# Checks that the arguments are in bounds
	def test_boundscheck
		assert_raise( RuntimeError ) { Door.new(-1) }
	end

end
