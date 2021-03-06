class TestUser < ApplicationRecord

  SUCCESS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create 
  before_validation :before_validation_next_question, on: :update

  def self.tests_success  
    TestUser.where(successful_tests: true)
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions +=1
    end

    save!
  end

  def percentage_result
    (self.correct_questions * 100)/test.questions.count
  end

  def success_rate?
    percentage_result >= SUCCESS_RATE  
  end
  
  def index_question
    progress_index_question + 1
  end

  def progress_index_question
    test.questions.index(current_question)
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  
  def before_validation_next_question
    self.current_question = next_question if self.current_question.present?
  end


  
  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) && 
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids.present?
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
