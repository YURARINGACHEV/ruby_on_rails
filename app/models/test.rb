class Test < ApplicationRecord

  belongs_to :category

  has_many :questions

	has_many :test_users
  has_many :users, through: :test_users

  def self.order_mas_title(title)
    Test.joins('join categories on categories.id = tests.category_id').where(categories: { title: title }).order(title: :DESC).pluck('tests.title')
  end

end
