Rails.application.routes.draw do

  post 'login', to: 'authentication#authenticate'
  post 'new', to: 'posts#create'
  post 'signup', to: 'user#create'
  patch 'edit', to: 'posts#update'
  patch 'delete', to: 'posts#destroy'
  resources :posts

end
