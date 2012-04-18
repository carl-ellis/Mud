require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class RepositoryJsonTest < Test::Unit::TestCase

	class Testclass
		attr_accessor :id, :name

		def initialize(id, name)
			@id, @name = id, name
		end
	end

	CACHE_SIZE = 10

	def setup()
		Options.storage = :json
		Options.storage_options[:data_dir] = "./data/"
		Configuration.configure_using_options(Options)
		Repository.new(CACHE_SIZE)
		Repository.repo.freeid(0)
	end

	# Tests the garbage collection check for deletion
	def test_garbagecheck
		assert_equal(true, Repository.repo.garbage_check(3), "Saying it isn't connected when it is")
		assert_equal(false, Repository.repo.garbage_check(14), "Saying it is connected when it isn't")
		assert_equal(true, Repository.repo.garbage_check(0), "Freeid object isn't protected!")
	end

	def test_add_and_remove

		# Create an object
		test_object = Area.new(0, "Tester area", [])
		id = Repository.create(test_object)
		test_object.id = id

		# Remove from memory
		test_object = nil

		# Get the object and check it has been made correctly
		test_object = Repository.get(id)
		assert_equal("Tester area", test_object.name, "Object not created correctly")

		# Remove the object
		assert_equal(true, Repository.delete(id), "Object didn't delete, garbage check fail")

		# Check object has gone
		assert_equal(nil, Repository.get(id), "Object isn't deleted")

	end

	def test_nojson
		a = Testclass.new(1, "i")
		assert_raise(RuntimeError){Repository.create(a)}
	end



end
