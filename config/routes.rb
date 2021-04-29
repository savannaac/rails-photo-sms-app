Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "photos#index"
  
  resources :users, only: [:show] do
    resources :photos, only: [:show, :index]
  end

  resources :photos, only: [:index, :show, :new, :create, :edit, :update]
end
