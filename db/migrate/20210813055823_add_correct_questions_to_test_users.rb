class AddCorrectQuestionsToTestUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :test_users, :correct_questions, :integer, default: 0
    add_reference :test_users, :current_question, foreign_key: { to_table: :questions }
  end
end
