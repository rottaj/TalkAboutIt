Rails.application.routes.draw do
	
 	resources :categories
 	resources :posts
	resources :users
	# resources :replies
	
	get '/verify', to: 'users#verify', as: 'verify'
	post '/verify', to: 'users#verify', as: 'verifycode'
	get '/', to: 'welcome#index'
	get "/signin", to: "sessions#new", as: "signin"
	post "/sessions", to: "sessions#create", as: "sessions"
	delete "/signin", to: "sessions#destroy" 
	post "/replies", to: "replies#create", as: "replies_new" 

end
