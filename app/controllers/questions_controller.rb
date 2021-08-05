class QuestionsController < ApplicationController

  before_action :find_test, only: %i[create]
  before_action :find_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: { questions: Test.find(params[:test_id]).questions }
  end

  def show
    render json: { questions: @question}
  end

  def new
  end

  def create
    question = @test.questions.create(question_params)

    if question.save
      redirect_to question
      # render plain: question.inspect
    else
      render :new, status: :unprocessable_entity
      # render plain: "Невалидные данные"
    end
  end

  def destroy
    @question.destroy    
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end
  
  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question was not found"
  end

end
