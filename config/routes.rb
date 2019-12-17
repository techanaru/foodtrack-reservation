Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get 'reservations'
      get 'favorites'
    end
  end
  
  resources :food_tracks
  resources :food_menus
  resources :user_food_track_favorites, only: [:create, :destroy]
  resources :reservations, only: [:create, :destroy]
  resources :track_place_relationships, only: [:create, :destroy]
end
