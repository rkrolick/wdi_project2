Rails.application.routes.draw do
  resource :session
  resources :users
  resources :factorio_maps
  resources :comments
end
