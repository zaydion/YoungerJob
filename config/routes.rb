Rails.application.routes.draw do
  get '/user_login', to: 'sessions#user_new'
  get '/company_login', to: 'sessions#company_new'
  post '/user_login', to: 'sessions#create'
  post '/company_login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'static#welcome'

  resources :companies, except: [:index] do
    resources :posts
  end

  resources :users, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
