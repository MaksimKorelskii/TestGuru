class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def user_tests(level)
    tests.where(level: level)
  end
end
