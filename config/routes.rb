Rails.application.routes.draw do
  devise_for :admins, controllers: { omniauth_callbacks: "admins/omniauth_callbacks" }
  devise_for :users #, controllers: { omniauth_callbacks: "omniauth" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :admin do
    get "admins/sign_in", to: "admins/sessions#new", as: :new_admin_session
    get "admins/sing_out", to: "admins/sessions#destroy", as: :destroy_admin_session
  end
  
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