class UserTestUserBadge < ApplicationRecord

	belongs_to :user
  belongs_to :test
  belongs_to :test_user

end
