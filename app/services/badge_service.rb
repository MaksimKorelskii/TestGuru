class BadgeService
  CONDITIONS = {
    first_test:            Badges::FirstTest,
    all_tests_in_category: Badges::AllTestsInCategory,
    all_tests_with_level:  Badges::AllTestsWithLevel
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.find_each do |badge|
      condition = CONDITIONS[badge.condition.to_sym].new(@test_passage, badge.condition_parameter)
      add_badge!(badge) if condition.satisfied?
    end
  end

  private

  def add_badge!(badge)
    @user.badges << badge
  end
end
