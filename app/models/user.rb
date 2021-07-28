class User < ApplicationRecord

  has_many :test_users
  has_many :tests, through: :test_users

  def show_list_test(level)
    Test.joins('join test_users on tests.id = test_users.test_id').where(tests: { level: level }).where(test_users: {user_id: self.id})

  end

end
