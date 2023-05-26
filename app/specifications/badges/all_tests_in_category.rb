module Badges
  class AllTestsInCategory < AbstractConditionSpecification
    def satisfied?
      return false if @test_passage.test.category_id != @condition_parameter.to_i

      correct_tests = @user.successful_tests_by_category(@condition_parameter).distinct.ids.count
      all_tests_in_category = Test.by_category(@condition_parameter).count

      correct_tests == all_tests_in_category
    end
  end
end
