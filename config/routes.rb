Rails.application.routes.draw do
  resources :products, only: [:index, :show, :create]
  get '/product', to: 'products#search'

  get '/ingredients', to: 'ingredients#index'
  get '/ingredient', to: 'ingredients#search'
end
