Rails.application.routes.draw do
	get '/auth/github', to: 'authentication#github', format: false
	get '/api/currentUser', to: 'users#currentUser'

	resources :users
	namespace :api do
		resources :posts, except: [:new, :edit]
	end
end
