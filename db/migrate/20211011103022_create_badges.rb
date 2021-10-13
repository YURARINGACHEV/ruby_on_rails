class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.text :title, null: false
      t.text :image_url, null: false
      t.text :rule, null: false
      t.text :value, null: false

      t.timestamps
    end
  end
end
