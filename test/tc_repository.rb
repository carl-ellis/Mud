require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class RepositoryTest < Test::Unit::TestCase

	CACHE_SIZE = 10

	def setup()
		Configuration.configure_using_options(Options)
		Repository.new(CACHE_SIZE)
	end

	# Checks that arguments are rejected if they're wrong
	def test_caching
		1.upto(CACHE_SIZE+1){ |i| Repository.repo.add_to_cache(Template.new(i, "a", "b"))}
		assert_nothing_thrown "Cache overflown" do
			Repository.get(CACHE_SIZE)
		end
		assert_raise(RuntimeError) { Repository.get(1) }
	end

  def test_nofreetracking
		assert_raise(RuntimeError) { Repository.repo.next_id }
  end

end
