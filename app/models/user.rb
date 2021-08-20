require 'digest/sha1'

class User < ApplicationRecord

  EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_reader :password
  attr_writer :password_confirmation

  has_many :author_tests, class_name: "Test", foreign_key: :user_id
  has_many :test_users
  has_many :tests, through: :test_users

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL }

  def show_list_test(level)
    tests.where(level: level)
  end

  def test_user(test)
    test_users.order(id: :desc).find_by(test_id: test.id)
  end
  
  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end


end

