# Создайте ресурс Вопросов, вложенный в ресурс Тестов
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # get "tests/questions", to: "questions#index"

  # get "tests/:id", to: 'questions#show'
  
  resources :tests do 
    resources :questions
  end



end
