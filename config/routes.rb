Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  post 'todolists' => 'todolists#create'
  
  resources :users do
  member do
    get :following, :followers
   end
  end

  devise_for :users
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end
  

  resources :book, only: [:new, :create, :index, :show] do
    resources :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]

  get 'search' => 'searches#search'
  
end
