class FeedbacksMailer < ApplicationMailer
  def sent(feedback)
    @feedback = feedback
    @admin = User.find_by(type: 'Admin')

    mail to: @admin.email, from: @feedback.user.email, subject: "TestGuru Feedback"
  end
end
