Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "application#home"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/signup", to: "users#new"

  resources :users, except: [:new] do
    resources :photos
  end
  
  get "all", to: "photos#all"
end