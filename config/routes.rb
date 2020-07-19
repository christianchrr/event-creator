Rails.application.routes.draw do
  root 'events#index'
  get "/auth/google_oauth2/callback", to: 'sessions#create'
  resources :locations do
    resources :events
  end
  resources :events
  resources :users do
    # resources :events, only: [:index]
  end
  resources :sessions
  get '/logout' => "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
