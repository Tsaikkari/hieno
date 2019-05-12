Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users
  resources :products do
    resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy]
  root 'simple_pages#index'

  get 'simple_pages/about'
  get 'simple_pages/contact'
  post 'simple_pages/thank_you'
  post 'payments/create'
  mount ActionCable.server => '/cable'
end
