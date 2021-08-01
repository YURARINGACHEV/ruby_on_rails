class User < ApplicationRecord
  
  validates :email, presence: true, uniqueness: true

  has_many :author_tests, class_name: "Test"

  has_many :test_users

  has_many :tests, through: :test_users

  def show_list_test(level)
    tests.where(level: level)
  end
  
end

