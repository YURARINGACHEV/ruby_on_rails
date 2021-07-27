class Test < ApplicationRecord

	has_many :test_users

  def self.order_mas_title(title)
    Test.joins('join categories on categories.id = tests.category_id').where(categories: { title: title }).order(title: :DESC).pluck('tests.title')
  end

end
