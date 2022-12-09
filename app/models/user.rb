class User < ApplicationRecord
  def user_tests(level)
    Test.joins('JOIN user_tests ON tests.id = user_tests.test_id')
        .where(user_tests: { user_id: self.id }, tests: { level: level })
  end
end
