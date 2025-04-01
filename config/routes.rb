Rails.application.routes.draw do
  devise_for :users

  root "pages#home"

  resources :profiles, only: [:index, :show]
  resources :experiences
  resources :bookings, only: [:index, :show,:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  get "webmanifest"    => "pwa#manifest"
  get "service-worker" => "pwa#service_worker"
end
