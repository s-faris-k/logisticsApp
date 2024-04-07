Rails.application.routes.draw do
  # resources :trips
  # resources :expenses
  # resources :clients
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

  get "trips", to: "trips#index"
  get "new_trip", to: "trips#new_trip" 
  post "create_trip", to: "trips#create_trip", as: :create_trip
  get "edit_trip/:id", to: "trips#edit_trip", as: :edit_trip
  patch "update_trip/:id", to: "trips#update_trip", as: :update_trip
  delete "delete_trip/:id", to: "trips#delete_trip", as: :delete_trip

  get "clients", to: "clients#index"
  get "new_client", to: "clients#new_client"
  post "create_client", to: "clients#create_client", as: :create_client
  get "edit_client/:id", to: "clients#edit_client", as: :edit_client
  patch "update_client/:id", to: "clients#update_client", as: :update_client
  delete "delete_client/:id", to: "clients#delete_client", as: :delete_client

  # resources :clients
  get "expenses", to: "expenses#index"
  get "new_expense", to: "expenses#new_expense"
  post "create_expense", to: "expenses#create_expense", as: :create_expense
  get "edit_expense/:id", to: "expenses#edit_expense", as: :edit_expense
  patch "update_expense/:id", to: "expenses#update_expense", as: :update_expense
  delete "delete_expense/:id", to: "expenses#delete_expense", as: :delete_expense
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
