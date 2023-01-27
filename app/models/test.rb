class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :high_level, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category)
                                      .where(categories: { title: category }) }

  def self.tests_by_category(category)
    by_category(category).pluck(:title).order(title: :DESC)
  end

  def questions_present?
    questions.present?
  end

  def passed?
    passed == true
  end
end
