class GistQuestionService

  ACCESS_TOKEN =  ENV['GITHUB_TOKEN']
  STATUS = 201
 
  def initialize(question, client: nil)
  	@question = question
  	@test = @question.test
  	@client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
  	@client.create_gist(gist_params)
  end
  
  def url
    @client.last_response.data[:html_url]
  end

  def success?
    @client.last_response.status == 201
  end

  private

  def gist_params
  	{
  		description: I18n.t(".services.gist_question_service.description", title:@test.title),
  		files: {
  			I18n.t(".services.gist_question_service.file") => {
  				content: gist_content
  			}
  		}
  	}
  end

  def gist_content
  	content = [@question.body]
  	content += @question.answers.pluck(:body)
  	content.join("\n")
  end

end

