Rails.application.routes.draw do
  root 'tests#index'

  resources :badges, only: %i[ index index_user ]
  get :user_badges, to: 'badges#index_user'

  resources :feedbacks, only: %i[ new create ]

  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[ show update ] do
    get :result, on: :member
    post 'gist', to: "gists#create", on: :member
  end

  namespace :admin do
    resources :badges
    resources :feedbacks, only: %i[ index ]

    get 'gists', to: "gists#index" 
    
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
