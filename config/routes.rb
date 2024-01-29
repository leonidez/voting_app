Rails.application.routes.draw do
  get 'votes', to: 'votes#index'
  get 'votes/new'

  post '/sessions',   to: 'sessions#create'
  post '/candidates', to: 'candidates#create'
  post '/votes',      to: 'votes#create'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'sessions#new'
end
