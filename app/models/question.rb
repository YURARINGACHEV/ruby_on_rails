class Question < ApplicationRecord

  validates :body, presence: true

  has_many :answers, dependent: :destroy
  belongs_to :test
  has_many :gists, dependent: :destroy

end
