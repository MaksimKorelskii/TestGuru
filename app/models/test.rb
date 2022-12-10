class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests

  def self.tests_by_category(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: category })
        .order(title: :DESC)
        .pluck(:title)
  end
end
