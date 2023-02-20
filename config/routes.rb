Rails.application.routes.draw do
  resources :calculators
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "calculators#index"
   
end
