require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class FreeIdJsonTest < Test::Unit::TestCase

	def setup()
		Options.storage = :json
		Configuration.configure_using_options(Options)
    Repository.new(10)
	end

	# Checks that arguments are rejected if they're wrong
	def test_typecheck
		assert_raise( RuntimeError ) { FreeId.from_dir(0) }
	end

	# Checks that next uses the extras properly
	def test_freeid_data_dir
		assert_raise( RuntimeError ) { FreeId.from_dir("bob") }
		freeid = FreeId.from_dir("test/test_data/")
		assert_equal(0, freeid.next, "Extras not working")
		assert_equal(8, freeid.next, "Last not working")
		assert_equal(9, freeid.next, "Last not incrementing")
	end

  def test_repoattach
    assert_raise( RuntimeError){ Repository.repo.freeid(1) }
  end

end
