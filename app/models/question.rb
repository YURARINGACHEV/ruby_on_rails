class Question < ApplicationRecord

  validates :body, presence: true

  has_many :answer

  belongs_to :test



end
