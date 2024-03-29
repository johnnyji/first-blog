Rails.application.routes.draw do
  get 'author/session'

  resources :articles do
    resources :comments
  end

  root "articles#index"

  resources :authors
  resources :author_sessions, only: [:new, :create, :destroy]

  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
end
