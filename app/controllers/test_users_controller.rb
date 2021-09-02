#test_passages
class TestUsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_user, only: %i[update show result]

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

  private

  def set_test_user
    @test_user = TestUser.find(params[:id])
  end

end
