class Badge < ApplicationRecord
  CONDITIONS = %w[all_tests_in_category all_tests_with_level first_test].freeze

  has_many :badge_users, dependent: :destroy
  has_many :users, through: :badge_users

  validates :condition, inclusion: { in: CONDITIONS, message: "%{value} is not a valid condition." }
  validates :name, :condition, :image_url, presence: true
end
