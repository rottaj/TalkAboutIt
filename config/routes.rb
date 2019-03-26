Rails.application.routes.draw do
	
 	resources :badges
 	resources :categories
 	resources :posts
 	resources :users
	
	get '/', to: 'welcome#index'
	get "/signin", to: "sessions#new", as: "signin"
	post "/sessions", to: "sessions#create", as: "sessions" 
	 
end
