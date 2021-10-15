class AddSuccessfulTestsToTestUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :test_users, :successful_tests, :boolean, default: false
  end
end
