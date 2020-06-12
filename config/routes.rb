Rails.application.routes.draw do

  post 'signup', to: 'user#create'
  post 'login', to: 'authentication#authenticate'
  post 'new', to: 'posts#create'
  patch 'delete', to: 'posts#destroy'
  patch 'edit', to: 'posts#update'
  resources :posts

end
