Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # devise_scope :user do
  #   get "sign_in", :to => "devise/sessions#new", as: :new_user_session 
  #   get "sign_out", :to => "devise/sessions#destroy", as: :destroy_user_session
  # end

  root "application#home"

  get "all", to: "application#all", as: "all"

  resources :users do
    resources :photos
  end

  resources :photos do
    resources :likes
  end
  
  # for simple like feature
  # put "/photo/:id/like", to: "photos#like", as: "like"
end