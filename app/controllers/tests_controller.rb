class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)

    if @test.questions_present?
      redirect_to current_user.test_passage(@test)
    else
      redirect_to root_path, alert: t('.no_questions')
    end
  end
end
