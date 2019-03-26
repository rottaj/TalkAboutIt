Rails.application.routes.draw do
	root :to => 'welcome#index'
 	resources :badges
 	resources :categories
 	resources :posts
 	resources :users
 	resources :sessions, only: [:new, :create, :destroy]
 	get 'signup', to: 'users#new', as: 'signup'
 	get 'login', to: 'sessions#new', as: 'login'
 	get 'logout', to: 'sessions#destroy', as: 'logout'
 	post 'login', to: 'sessions#new'
 	
 	#get '/login_users' => 'users#login'
 	#post '/login_users' => 'users#login'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
