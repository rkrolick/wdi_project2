Rails.application.routes.draw do

  root to: "factorio_maps#index"

  #resource :session
  #resources :users
  resources :factorio_maps
  #resources :comments
end
