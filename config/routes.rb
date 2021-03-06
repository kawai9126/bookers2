Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'search' => 'search#search'
  get 'home/about' => 'homes#about'
  get 'user/follow' => 'users#follow'
  get 'user/follower' => 'users#follower'
  # resources :books
  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
