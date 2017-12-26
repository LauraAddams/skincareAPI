Rails.application.routes.draw do
  resources :products, only: [:index, :show, :create]

  get '/search', to: 'products#search'

  get '/ingredients', to: 'ingredients#index'
end
