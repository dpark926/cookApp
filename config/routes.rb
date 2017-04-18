Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cooks do
    resources :foods
  end
  # resources :foods , only: [:new,:index]
  # post '/cooks/:id' , to: 'food#create' , as: :post_food
  root :to => 'static#home'
end
