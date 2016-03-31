Rails.application.routes.draw do

  devise_for :users
  root to: "factorio_maps#index"

  # NHO: reminder to remove unused / commented out code
  #resource :session
  #resources :users

  resources :factorio_maps, except: [:new] do
    resources :comments
  end


end
