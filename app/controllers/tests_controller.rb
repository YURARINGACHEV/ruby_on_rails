class TestsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :all_test, only: [:index] 
  before_action :find_test, only: [:start]

  def index

  end

  def start
    if @test.questions.empty?
      redirect_to root_path, alert:  t(".questions", title: @test.title)
    else
    current_user.tests.push(@test)
    redirect_to current_user.test_user(@test)
  end
end


  private
  
  def all_test
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
