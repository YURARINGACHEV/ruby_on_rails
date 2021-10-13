class Badge < ApplicationRecord

	has_many :user_test_badges, dependent: :destroy
  has_many :test, through: :user_test_badges
  has_many :user, through: :user_test_badges

  validates :title, presence: true
  validates :rule, presence: true
  validates :value, presence: true
  validates :image_url, presence: true
  
  def category_complete
  end

  def tests_of_a_certain_level
  end

  def on_the_first_try

  end

end


