Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :managers
  resources :construction_resources
  resources :constructions
  resources :resources
  resources :brands
  resources :categories
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  get 'api/news'
  get 'api/:date1/:date2', to: 'api#between_dates'
end
