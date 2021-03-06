Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'static#home'

  resources :cooks do
    resources :foods
  end

  resources :customers do
    resources :orders
    resources :reviews
  end

  get '/discover' , to: 'discover#index' , as: 'discover'
  get '/discover/:neighborhood', to: 'discover#index' 
  # post '/discover', to: 'discover#index'

  get '/login' , to: 'sessions#new' , as: :login
  post '/sessions' , to: 'sessions#create', as: :create_session
  get '/logout', to: 'sessions#destroy' , as: :logout
end
