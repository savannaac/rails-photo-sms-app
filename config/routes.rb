Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "application#home"

  resources :users do
    resources :photos
  end
  
  get "all", to: "photos#all"
end