class AbstractConditionSpecification
  def initialize(test_passage, condition_parameter)
    @test_passage = test_passage
    @condition_parameter = condition_parameter
    @user = test_passage.user
  end
end
