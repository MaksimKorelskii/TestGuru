class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @test = test_passage.test
    @user = test_passage.user

    mail to: @user.email, subject: "You just completed the Test-app test!"
  end
end
