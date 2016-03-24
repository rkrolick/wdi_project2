Rails.application.routes.draw do

  devise_for :users
  root to: "factorio_maps#index"

  #resource :session
  #resources :users
  resources :factorio_maps, except: [:new] do
    resources :comments
  end


end
