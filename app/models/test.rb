class Test < ApplicationRecord

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true, uniqueness: { scope: [:title, :level] }

  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy	
  has_many :users, through: :test_users

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :join_category_test, -> (title)  { self.joins(:category).where(categories: { title: title }) }  

  def self.order_mas_title(title)
    join_category_test(title).order(title: :DESC).pluck("tests.title")
  end

  def self.order_mas_id(title)
    join_category_test(title).order(title: :DESC).pluck(:id)
  end

  def self.order_mas_level(title)
    join_category_test(title).order(title: :DESC).pluck("tests.level")
  end

  def timer_zero?
    self.passage_timer > 0
  end

end