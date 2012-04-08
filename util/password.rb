# Based on: http://www.zacharyfox.com/blog/ruby-on-rails/password-hashing
# Modified to use BCrypt

# This module contains functions for hashing and storing passwords
class Password

  # Generates a new salt and rehashes the password
  def Password.update(password)
		salt = self.salt
    hash = self.create_hash(password, salt)
		self.store(hash, salt)
  end

  # Checks the password against the stored password
  def Password.check(password, store)
		salt = get_salt(store)
		hash = get_hash(store)
    hash = BCrypt::Password.new(hash)
    hash == "#{password}:#{salt}"
  end

	protected

	# Create a random salt
	def Password.salt
		salt = ""
    64.times { salt << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
    salt
	end

	# Create the hash using a salt
	def Password.create_hash(password, salt)
    BCrypt::Password.create("#{password}:#{salt}").to_s
	end

  # Combine the hash and the salt for storage
	def Password.store(hash, salt)
		"#{hash}#{salt}"
	end

	# Get the hash from the stored string
	def Password.get_hash(store)
		store[0..59]
	end

	# Get the salt from the end of the stored hash
	def Password.get_salt(store)
		store[60..124]
	end
end
