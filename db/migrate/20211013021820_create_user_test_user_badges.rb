class CreateUserTestUserBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :user_test_user_badges do |t|
      t.references :user, foreign_key: true
      t.references :badge, foreign_key: true

      t.timestamps
    end
  end
end
