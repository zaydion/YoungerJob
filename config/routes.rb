Rails.application.routes.draw do
  root 'static#welcome'

  get '/user_login', to: 'sessions#user_new'
  post '/user_login', to: 'sessions#create'
  get '/company_login', to: 'sessions#company_new'
  post '/company_login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :companies, except: [:index] do
    resources :posts
  end

  resources :users, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
