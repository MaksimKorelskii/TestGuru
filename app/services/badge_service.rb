class BadgeService
  # def initialize(question, client: nil)
  #   @question = question
  #   @test = @question.test
  #   @client = client || Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  # end

  # def call
  #   @client.create_gist(gist_params)
  # end

  # def success?
  #   @client.last_response.status == 201
  # end

  # private

  # def gist_params
  #   {
  #     "description": I18n.t('gist_question_service.description', test: @test.title),
  #     "public": true,
  #     "files": {
  #       "test-app-question.txt": {
  #         "content": gist_content
  #       }
  #     }
  #   }
  # end

  # def gist_content
  #   [@question.body, *@question.answers.pluck(:body)].join("\n")
  # end
end
