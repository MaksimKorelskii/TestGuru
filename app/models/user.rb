class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :badge_users, dependent: :destroy
  has_many :badges, through: :badge_users

  has_many :feedbacks, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, 
            format: { with: URI::MailTo::EMAIL_REGEXP }

  def user_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :DESC).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
