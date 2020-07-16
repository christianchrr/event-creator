Rails.application.routes.draw do
  root 'sessions#new'
  resources :locations
  resources :events
  resources :users do
    resources :events, only: [:index]
  end
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
