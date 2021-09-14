#test_passages
class TestUsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_user, only: %i[update show result gist]

  def show
  end

  def result
  end

  def update
    @test_user.accept!(params[:answer_ids])

    if @test_user.completed?
      TestsMailer.completed_test(@test_user).deliver_now
      redirect_to result_test_user_path(@test_user)
    else
      render :show
    end
  end

 def gist
    result = GistQuestionService.new(@test_user.current_question)
    result.call

    flash_options = if result.success?
      gist = current_user.gists.create(gist_url: response.url, question: @test_passage.current_question)
       { notice: t('.success') }
      
    else
      { alert: t(".failure") }
    end

    redirect_to @test_user, flash_options
    
  end

  private

  def set_test_user
    @test_user = TestUser.find(params[:id])
  end

end
