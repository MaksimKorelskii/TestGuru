class TestPassage < ApplicationRecord
  CORRECT_QUESTIONS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_current_question, on: :create

  def successful?
    correct_question_percentage >= CORRECT_QUESTIONS_RATIO
  end

  def correct_question_percentage
    correct_questions.to_f / test.questions.count * 100
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    self.current_question = next_question
    save!
  end

  private

  def before_validation_set_current_question
    self.current_question = test.questions.first if test.present?
    # self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
    # if self.current_question.present?
    #   self.test.questions.order(:position).where('position > ?', current_question.position).first
    # else
    #   self.current_question = self.test.questions.find_by(position: 1)
    # end
  end
end
