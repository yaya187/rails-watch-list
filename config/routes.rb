Rails.application.routes.draw do
  # Pour voir toutes les listes
  root to: 'lists#index'

  # Pour voir les détails d'une liste donnée
  get 'lists/:id', to: 'lists#show', as: 'list'

  # Pour créer une nouvelle liste
  get 'lists/new', to: 'lists#new', as: 'new_list'
  post 'lists', to: 'lists#create'

  # Pour ajouter un nouveau signet à une liste existante
  get 'lists/:list_id/bookmarks/new', to: 'bookmarks#new', as: 'new_list_bookmark'
  post 'lists/:list_id/bookmarks', to: 'bookmarks#create'

  # Pour supprimer un signet d'une liste
  delete 'bookmarks/:id', to: 'bookmarks#destroy', as: 'bookmark'
  resources :movies, only: [:show]
  resources :lists do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
end
