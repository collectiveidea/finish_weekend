class User < ActiveRecord::Base
  attr_accessible :username, :email, :password
  attr_accessor :password, :confirm_password

  before_save :encrypt_password

  validates :username,  :presence => true, :uniqueness => true
  validates :email,     :presence => true

  def encrypt_password
    if password.present? && confirm_password.present? && password == confirm_password
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret password, password_salt
    else
      false
    end
  end

  def self.authenticate(username, password)
    user = find_by_username username
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
