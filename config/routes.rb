Rails.application.routes.draw do
	get '/auth/github', to: 'authentication#github', format: false

	namespace :api do
		resources :posts, except: [:new, :edit]
		resources :users, except: [:new, :edit]
		get '/connections_posts', to: 'posts#connections_posts'
		get '/currentUser', to: 'users#currentUser'
		get '/currentUser_posts', to: 'users#currentUser_posts'
		get '/user_posts/:user_id', to: 'users#user_posts'
		get '/userConnections', to: 'users#userConnections'
		get '/userConnectionsIds', to: 'users#userConnectionsIds'
		post '/connections', to: 'users#addConnection'
	end
end
