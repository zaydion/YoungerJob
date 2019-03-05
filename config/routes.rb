Rails.application.routes.draw do
  root 'static#welcome'
  resources :companies, except: [:index] do
    resources :posts
  end
  resources :users, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
