class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def user_tests(level)
    tests.where(level: level)
  end
end
