class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end

  # GitHubGist = Struct.new(:args) do

  #   def success?
  #     args[:gist] ? true : false
  #   end

  #   def gist_url
  #     args[:gist][:html_url] if success?
  #   end

  #   # def error_message
  #   #   args[:error]
  #   # end
  # end

  def call
    @client.create_gist(gist_params)
    # GitHubGist.new(gist: @client.create_gist(gist_params))
  end

  private

  def gist_params
    {
      "description": I18n.t('gist_question_service.description', test: @test.title),
      "public": true,
      "files": {
        "test-app-question.txt": {
          "content": gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
    # content = [@question.body]
    # content += @question.answers.pluck(:body)
    # content.join("\n")
  end
end
