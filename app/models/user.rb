class User < ApplicationRecord
  def show_list_test(level)
    Test.joins('join test_users on tests.id = test_users.test_id').where(tests: { level: level }).where(test_users: {user_id: self.id})

  end

end
