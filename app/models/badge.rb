class Badge < ApplicationRecord

	has_many :user_test_badges
  has_many :users, through: :user_test_badges
  has_many :test_users, through: :user_test_badges

  validates :title, presence: true
  validates :rule, presence: true
  validates :value, presence: true
  validates :image_url, presence: true
  

end


