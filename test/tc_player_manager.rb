require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class PlayerManagerTest < Test::Unit::TestCase

	def setup()
		Configuration.configure_using_options(Options)
	end

	# Checks that arguments are rejected if they're wrong
	def test_typecheck
		assert_raise( RuntimeError ) { PlayerManager.new("1", {}) }
		assert_raise( RuntimeError ) { PlayerManager.new(1, "{}") }
	end

	# Checks that names are rejected if need be
	def test_typecheck
    pm = PlayerManager.new(1, {})
    assert_equal(true, PlayerManager.restricted_name?("new"), "Restricted names are not being restricted")
    assert_equal(false, PlayerManager.restricted_name?("bob"), "Non-restricted names are not being restricted")
	end

  # Checks players are added properly
  def test_player_add
    pm = PlayerManager.new(1, {})
    p =  Player.new(2, "Bob", "3", "4", 5, 6, 7, {}, 9, [])

    assert_equal(false, pm.exists?("Bobby"), "Player check not working!")

    pm.add_player(p)
    assert_equal(true, pm.exists?("Bob"), "Player not added!")

    assert_equal(2, pm.get_id("Bob"), "Player id isn't being stored")
  end


end
