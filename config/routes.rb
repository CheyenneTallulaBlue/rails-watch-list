Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "movies", to: "movies#index"

  root to: 'lists#index'

  resources :lists, only: [:index, :new, :create, :show] do

  resources :bookmarks, only: [:new, :create]

  end
  resources :bookmarks, only: :destroy
end
