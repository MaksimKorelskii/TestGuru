module Badges
  class AllTestsWithLevel < AbstractConditionSpecification
    def satisfied?
      return false unless @test_passage.test.level == @condition_parameter.to_i

      correct_tests = @user.successful_tests_by_level(@condition_parameter).distinct.ids.count
      all_tests_with_level = Test.by_level(@condition_parameter).count

      correct_tests == all_tests_with_level
    end
  end
end
