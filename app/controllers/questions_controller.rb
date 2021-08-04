class QuestionsController < ApplicationController

  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: { questions: Question.all }
  end

  def show
    render inline '<%=test.title%>'
  end

  def new
  end

  def create
    question = Question.create(question_params)

    render plain: question.inspect

  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy    
  end

  private
  
  def find_test
    @test = Test.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question was not found"
  end

end
