class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  def user_tests(level)
    Test.joins('JOIN user_tests ON tests.id = user_tests.test_id')
        .where(user_tests: { user_id: self.id }, tests: { level: level })
  end
end
