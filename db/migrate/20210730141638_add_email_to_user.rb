class AddEmailToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, uniqueness: true
  end
end