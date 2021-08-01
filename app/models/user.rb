class User < ApplicationRecord
  
  validates :email, presence: true, uniqueness: true

  has_many :author_tests, class_name: "Test"

  has_many :test_users

  has_many :tests, through: :test_users

  def show_list_test(level)
    Test.joins(:test_users).where(tests: { level: level }).where(test_users: {user_id: self.id})
  end

  # def show_list_test_1(level)
  #   Test.joins('join test_users on tests.id = test_users.test_id').where(tests: { level: level }).where(test_users: {user_id: self.id})
  # end

end
