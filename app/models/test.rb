class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy_level, -> { where(level: 0..1).order(created_at: :DESC) }
  scope :medium_level, -> { where(level: 2..4).order(created_at: :DESC) }
  scope :high_level, -> { where(level: 5..Float::INFINITY).order(created_at: :DESC) }
  scope :by_category, -> (category) { joins(:category)
                                      .where(categories: { title: category })
                                      .order(title: :DESC) }

  def self.tests_by_category(category)
    by_category(category).pluck(:title)
  end
end
