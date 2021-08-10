module QuestionsHelper

# Для заголовка формы создания и редактирования вопроса. Это должен быть 
# один метод question_header который в форме создания вопроса будет выводить 
# Create New <Test Title> Question, а в форме редактирования Edit <Test Title> Question
# ну, в этом и есть смысл метода, чтобы понять как проверить)
  def question_header(test_title)
    if @questions.present?
      "Create New <#{test_title}> Question"
    else 
      "Edit <#{test_title}> Question"
    end
        
    
  end

end
