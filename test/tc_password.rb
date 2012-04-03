require './options.rb'
require './configuration.rb'
require 'test/unit'

# Tests for Area
class PasswordTest < Test::Unit::TestCase

	def setup()
		Configuration.configure_using_options(Options)
	end

	# Checks that arguments are rejected if they're wrong
	def test_password
    p1 = "mypassword123"
    p2 = "mypassword1234"
    s1 = Password.update(p1)
    assert_equal(true, Password.check(p1,s1), "Password was not stored correctly")
    assert_equal(false, Password.check(p2,s1), "Password check is broken")
	end
end
