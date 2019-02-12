Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  root 'simple_pages#landing_page'
  get 'simple_pages/index'
  get 'simple_pages/about'
  get 'simple_pages/contact'
end
