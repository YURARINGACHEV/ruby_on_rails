class TestsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :all_test, only: [:index] 
  before_action :find_test, only: [:show, :edit, :update, :destroy, :start]

  def index

  end

  def show
  
  end
 
  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit

  end

  def update
 
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end
  
  def destroy
    @test.destroy    
    redirect_to tests_path
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

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id )
  end

end
