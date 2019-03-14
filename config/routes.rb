Rails.application.routes.draw do
  root 'static#welcome'

  get '/user_login', to: 'sessions#user_new'
  post '/user_login', to: 'sessions#create'
  get '/company_login', to: 'sessions#company_new'
  post '/company_login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :companies, except: [:index] do
    resources :posts do
      get '/new_email', to: 'posts#new_email'
      post '/send_email', to: 'posts#send_email'
    end
  end

  resources :users, except: [:index]
  get '/users/:id/matches', to: 'users#matches', as: :user_matches
  get '/posts', to: 'posts#all_posts'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
