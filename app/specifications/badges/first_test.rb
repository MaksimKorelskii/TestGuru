module Badges
  class FirstTest < AbstractConditionSpecification
    def satisfied?
      TestPassage.user_successful(@user).count == 1
    end
  end
end
