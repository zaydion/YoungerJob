Rails.application.routes.draw do
  resources :posts
  resources :companies
  root 'static#welcome'
  resources :users, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
