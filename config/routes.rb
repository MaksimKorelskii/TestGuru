Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[ show update ] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
