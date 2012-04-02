require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class FreeIdTest < Test::Unit::TestCase

	@freeid

	def setup()
		Configuration.configure_using_options(Options)
		Repository.new(10)
		@freeid = FreeId.new(0, [6], 1);
	end

	# Checks that arguments are rejected if they're wrong
	def test_typecheck
		assert_raise( RuntimeError ) { FreeId.new("0", [], 1) }
		assert_raise( RuntimeError ) { FreeId.new(0, "[]", 1) }
		assert_raise( RuntimeError ) { FreeId.new(0, [], "1") }
	end

	# Checks that next uses the extras properly
	def test_next
		assert_equal(6, @freeid.next, "Extras not working")
		assert_equal(1, @freeid.next, "Last not working")
		assert_equal(2, @freeid.next, "Last not incrementing")
	end

	# Checks that add adds to the extras
	def test_add
		assert_raise( RuntimeError ) { @freeid.add("Yo") }
		@freeid.next
		@freeid.next
		@freeid.add(6)
		assert_equal(6, @freeid.next, "Add not working")
		assert_equal(2, @freeid.next, "Last not working after add")
	end
		

end
