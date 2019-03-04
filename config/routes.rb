Rails.application.routes.draw do
  root 'static#welcome'
  resources :posts
  resources :companies, except: [:index]
  resources :users, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
