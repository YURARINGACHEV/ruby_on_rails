class AddIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, %i[title level], unique: true
    add_index :test_users, %i[user_id test_id]
    add_index :tests, %i[category_id user_id]
  end
end
