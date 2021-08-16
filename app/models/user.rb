class User < ApplicationRecord
  
  validates :email, presence: true, uniqueness: true

  has_many :author_tests, class_name: "Test", foreign_key: :user_id

  has_many :test_users

  has_many :tests, through: :test_users

  def show_list_test(level)
    tests.where(level: level)
  end

  def test_user(test)
    test_users.order(id: :desc).find_by(test_id: test.id)
  end
  
end

