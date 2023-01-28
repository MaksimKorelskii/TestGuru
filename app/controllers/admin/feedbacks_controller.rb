class Admin::FeedbacksController < Admin::BaseController
  def index
    @feedbacks = Feedback.all
  end
end
