require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class TemplateTest < Test::Unit::TestCase

	def setup()
		Configuration.configure_using_options(Options)
	end

	# Checks that arguments are rejected if they're wrong
	def test_typecheck
		assert_raise( RuntimeError ) { Template.new("1", "Test", "A Test") }
		assert_raise( RuntimeError ) { Template.new(1, 2, "A Test") }
		assert_raise( RuntimeError ) { Template.new(1, "Test", 3) }
	end

end
