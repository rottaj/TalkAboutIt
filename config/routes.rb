Rails.application.routes.draw do
	
	get '/', to: 'welcome#index'
 	resources :badges
 	resources :categories
 	resources :posts
 	resources :users
	 
end
