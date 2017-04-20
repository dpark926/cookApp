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
  post '/discover', to: 'discover#index'
end
