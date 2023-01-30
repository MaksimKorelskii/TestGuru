module TestPassagesHelper
  def test_passage_result(test_passage)
    if test_passage.successful == true
      "<h2 class='success'>
        Result #{test_passage.correct_question_percentage}% You passed!
      </h2>".html_safe
    else
      "<h2 class='failure'>
        Result #{test_passage.correct_question_percentage}% You failed.
      </h2>".html_safe
    end
  end
end
