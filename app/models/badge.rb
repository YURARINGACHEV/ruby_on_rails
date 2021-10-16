class Badge < ApplicationRecord

  RULE = %i[category_complete tests_of_a_certain_level on_the_first_try]

	has_many :user_test_user_badges
  has_many :users, through: :user_test_user_badges

  validates :title, presence: true
  validates :rule, presence: true
  validates :value, presence: true
  validates :image_url, presence: true

  def self.select_badge
    @rule_type = RULE
  end
  

end
