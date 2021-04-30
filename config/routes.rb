Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show] do
    resources :photos, only: [:index, :new, :show]
  end

  resources :photos, only: [:create, :edit, :update, :destroy]
end