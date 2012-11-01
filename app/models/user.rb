#require 'digest'

require 'bcrypt'


class User < ActiveRecord::Base

include BCrypt

		attr_accessible :email,:password_hash, :password_salt, :password, :password_confirmation
		#maybe an attr_accessible for a custom method that edits permissions
		attr_accessor :password

		EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i
		validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
		validates :password, :confirmation => true #password_confirmation attr
		validates_length_of :password, :in => 6..20, :on => :create


		before_save :encrypt_new_password


		def self.authenticate (email, password)
			user = find_by_email(email)
			return user if user && user.authenticated?(password)
		end

		def authenticated? (password)
			self.password_hash == encrypt(password)
		end



	protected


		def self.authenticate(email,password)

			session = nil

			@user = User.find_by_email(email)

			if @user && Password.new(@user.password_hash) == password
				@user
			else
				@user = nil
			end

			@user

		end



		def encrypt_new_password
			return if password.blank?
			self.password_hash = encrypt(password)
		end

		def encrypt(string)
			BCrypt::Password.create(string)
#			Digest::SHA1.hexdigest(string)
		end

end
