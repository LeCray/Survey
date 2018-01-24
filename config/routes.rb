Rails.application.routes.draw do

	root to: 'pages#index'

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	delete '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :users
	resources :password_reset


  
end
