Rails.application.routes.draw do
	
 	resources :badges, only: [:index, :show]
 	resources :categories
 	resources :posts
 	resources :users
	get '/verify', to: 'users#verify', as: 'verify'
	post '/verify', to: 'users#verify', as: 'verifycode'
	get '/', to: 'welcome#index'
	get "/signin", to: "sessions#new", as: "signin"
	post "/sessions", to: "sessions#create", as: "sessions" 
	 
end
