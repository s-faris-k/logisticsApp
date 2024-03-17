Rails.application.routes.draw do
  resources :trips
  resources :expenses
  resources :clients
  # resources :drivers
  # resources :vehicles
 
  root 'main#home'
  get "home", to: "main#home"

  get "vehicles", to: "vehicles#index"
  get "new_vehicle", to: "vehicles#new"
  get "edit_vehicle/:id", to: "vehicles#edit_vehicle", as: :edit_vehicle
  patch "update_vehicle/:id", to: "vehicles#update_vehicle", as: :update_vehicle
  delete "delete_vehicle/:id", to: "vehicles#delete_vehicle", as: :delete_vehicle
  post "create_vehicle", to: "vehicles#create_vehicle", as: :create_vehicle


  get "drivers", to: "drivers#index"
  get "new_driver", to: "drivers#new_driver" 
  get "edit_driver/:id", to: "drivers#edit_driver", as: :edit_driver
  patch "update_driver/:id", to: "drivers#update_driver", as: :update_driver
  delete "delete_driver/:id", to: "drivers#delete_driver", as: :delete_driver
  post "create_driver", to: "drivers#create_driver", as: :create_driver




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
