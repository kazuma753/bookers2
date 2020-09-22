Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  post 'todolists' => 'todolists#create'
  devise_for :users
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users

  resources :book, only: [:new, :create, :index, :show] do
    resources :book_comments, only: [:create, :destroy]
  end
end
