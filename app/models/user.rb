class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates_uniqueness_of :email
  validates_length_of :password, minimum:8

  def self.authenticate_with_credentials(email, password)
    user = find_by(email: email.strip.downcase)
    user&.authenticate(password) || nil
  end
end
