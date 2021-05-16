Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "application#home"

  get "all", to: "application#all", as: "all"

  get "popular_photo", to: "application#popular_photo", as: "most_liked"

  resources :users do
    resources :photos
  end

  resources :photos do
    resources :likes
  end
  
  # for simple like feature
  # put "/photo/:id/like", to: "photos#like", as: "like"
end