class UserTestUserBadge < ApplicationRecord

	belongs_to :user
  belongs_to :test_user
  belongs_to :badge

end