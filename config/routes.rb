Rails.application.routes.draw do
  resources :profiles
  namespace :api do
  	resources :posts, except: [:new, :edit]
  end
end
