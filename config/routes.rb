Rails.application.routes.draw do
  resources :profiles
  root 'home#index'
  namespace :api do
  	resources :posts, except: [:new, :edit]
  end
end
