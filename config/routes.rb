Rails.application.routes.draw do
	get '/auth/github', to: 'authentication#github', format: false

	namespace :api do
		resources :posts, except: [:new, :edit]
		resources :users, except: [:new, :edit]
		get '/currentUser', to: 'users#currentUser'
		get '/userConnections', to: 'users#userConnections'
		get '/userConnectionsIds', to: 'users#userConnectionsIds'
		post '/connections', to: 'users#addConnection'
	end
end
