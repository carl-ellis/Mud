# Based on: http://www.zacharyfox.com/blog/ruby-on-rails/password-hashing
# Modified to use BCrypt

# This module contains functions for hashing and storing passwords
class Password

  # Generates a new salt and rehashes the password
  def Password.update(password)
    hash = BCrypt::Password.create(password).to_s
  end

  # Checks the password against the stored password
  def Password.check(password, store)
    hash = BCrypt::Password.new(store)
    hash == password
  end
end
