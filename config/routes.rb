Rails.application.routes.draw do
  devise_for :users

  root "pages#home"

  resources :profiles, only: [:index, :show] do
    patch :visitor, on: :member
    patch :local, on: :member
    resources :friend_requests, only: [:create, :update, :destroy]
  end

  get "/me", to: "profiles#me", as: :me

  resources :experiences do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :create, :destroy]


  get "webmanifest"    => "pwa#manifest"
  get "service-worker" => "pwa#service_worker"
end
