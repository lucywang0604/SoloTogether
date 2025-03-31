Rails.application.routes.draw do
  get 'friendships/create'
  get 'friendships/destroy'
  get 'bookings/create'
  get 'bookings/destroy'
  get 'experiences/index'
  get 'experiences/show'
  get 'experiences/new'
  get 'experiences/create'
  get 'experiences/edit'
  get 'experiences/update'
  get 'experiences/destroy'
  get 'profiles/index'
  get 'profiles/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
