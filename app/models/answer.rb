# У одного Вопроса может быть от 1-го до 4-х ответов.

class Answer < ApplicationRecord

  belongs_to :question

  scope :correct_answer, -> { where(correct: true) }

  validate :validate_max_answer, on: :create

  def validate_max_answer
    errors.add('Error: У одного Вопроса может быть от 1-го до 4-х ответов') if question.answer.size > 4
  end
  
end
