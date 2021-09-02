class TestsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :all_test, only: [:index] 
  before_action :find_test, only: [:start]

  def index

  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_user(@test)
  end

  private
  
  def all_test
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
