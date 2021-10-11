class User < ApplicationRecord

  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable,
         :validatable, 
         :confirmable

  has_many :author_tests, class_name: "Test", foreign_key: :user_id, dependent: :destroy
  has_many :test_users
  has_many :tests, through: :test_users
  has_many :gists
  has_many :badges, dependent: :destroy

  def show_list_test(level)
    tests.where(level: level)
  end

  def test_user(test)
    test_users.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

end
