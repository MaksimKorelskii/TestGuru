module TestPassagesHelper
  def test_passage_result(test_passage)
    if test_passage.successful?
      "<h2 class='success'>
        Result #{correct_question_percentage(test_passage)}% You passed!
      </h2>".html_safe
    else
      "<h2 class='failure'>
        Result #{correct_question_percentage(test_passage)}% You failed.
      </h2>".html_safe
    end
  end

  def correct_question_percentage(test_passage)
    test_passage.correct_questions.to_f / test_passage.test.questions.count * 100
  end
end
