Rails.application.routes.draw do
  resources :users
  namespace :api do
  	resources :posts, except: [:new, :edit]
  end
end
