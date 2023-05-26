module Badges
  class TestOnTheFirstTry < AbstractConditionSpecification
    def satisfied?
      TestPassage.tests_of_user(@user, @test_passage.test).count == 1
    end
  end
end
