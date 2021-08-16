# Создайте ресурс Вопросов, вложенный в ресурс Тестов
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # get "tests/questions", to: "questions#index"

  # get "tests/:id", to: 'questions#show'
  root 'tests#index'
  
  resources :tests do 
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    member do 
      post :start
    end

  end

  resources :test_users, only: %i[show update] do 
    member do 
      get :result
    end
  end

end
