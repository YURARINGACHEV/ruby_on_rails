Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
    
  resources :tests, only: :index do 
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
      post :gist
    end
  end

  namespace :admin do 
    resources :tests do
      patch :update_inline, on: :member
        
      resources :questions, shallow: true do
        resources :answers, shallow: true
    end
  end
  resources :gists, only: %i[show index]
  resources :badges 
end
  resources :form_back, only: %i[new create]
  resources :badges, only: %i[index]
end
