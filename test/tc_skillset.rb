require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class SkillsetTest < Test::Unit::TestCase

	def setup()
		Configuration.configure_using_options(Options)
	end

	# Checks that arguments are rejected if they're wrong
	def test_typecheck
		assert_raise( RuntimeError ) { Skillset.new("1", [:s]) }
		assert_raise( RuntimeError ) { Skillset.new(1, "[:s]") }
		assert_raise( RuntimeError ) { Skillset.new(1, []) }
		assert_raise( RuntimeError ) { Skillset.new(1, [:s, "d"]) }
	end
end
