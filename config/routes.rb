Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists do
    resources :bookmarks, only: %i[new create]
  end
  resources :movies, only: %i[show]
end
