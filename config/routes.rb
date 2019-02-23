Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  root 'simple_pages#index'

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/landing_page'
  post 'simple_pages/thank_you'
end
