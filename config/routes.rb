Rails.application.routes.draw do
	get '/auth/github', to: 'authentication#github', format: false

	resources :users
	namespace :api do
		resources :posts, except: [:new, :edit]
	end
end
