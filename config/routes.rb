Rails.application.routes.draw do

	root to: 'pages#index'

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	delete '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :users
	resources :password_reset
	resources :account_activations, only: [:edit]

	#SUB-CATEGORIES
	get 'on_residence_halls' 			=> 'sub_cats#on_residence_halls'
	get 'on_multiple_bedroom_houses' 	=> 'sub_cats#on_multiple_bedroom_houses'
	get 'off_individual_bedroom_houses' => 'sub_cats#off_individual_bedroom_houses'
	get 'off_multiple_bedroom_houses' 	=> 'sub_cats#off_multiple_bedroom_houses'
	get 'off_residence_halls'			=> 'sub_cats#off_residence_halls'
	get 'off_apartments' 				=> 'sub_cats#off_apartments'

	#ON CAMPUS RES
	get 'on_building_exterior' 			=> 'on_res_halls#building_exterior'
	get 'on_grounds_gardens' 			=> 'on_res_halls#grounds_gardens'
	get 'on_parking_driveway_signage' 	=> 'on_res_halls#parking_driveway_signage'
	get 'on_safety_security'			=> 'on_res_halls#safety_security'






end


<%= link_to off_building_exterior_path do %> <h6> Building Exterior </h6> <% end %>
<hr>
<%= link_to off_grounds_gardens_path do %> <h6> Grounds and Gardens </h6> <% end %>
<hr>
<%= link_to off_parking_driveway_signage_path do %> <h6> Parking, Driveway and Signage </h6> <% end %>
<hr>
<%= link_to off_safety_security_path do %> <h6> Safety and Security </h6> <% end %>