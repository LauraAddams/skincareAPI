Rails.application.routes.draw do
  resources :products, only: [:index, :show, :create]

  get '/ingredients', to: 'ingredients#index'
end
