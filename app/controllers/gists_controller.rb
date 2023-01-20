class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @test_passage = TestPassage.find(params[:id])
    @question = @test_passage.current_question
    result = GistQuestionService.new(@question)
    gist = result.call

    flash_options = if result.success?
      current_user.gists.create!(question: @question, url: gist.html_url)
      { notice: t('.success', gist_url: view_context.link_to('Gist', gist.html_url)) }
    else
      { alert: t('.failure') }
    end
    redirect_to @test_passage, flash_options  
  end
end
