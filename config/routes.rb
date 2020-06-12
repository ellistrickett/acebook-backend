Rails.application.routes.draw do

  post 'signup', to: 'user#create'
  post 'login', to: 'authentication#authenticate'
  post 'new', to: 'posts#create'
  patch 'delete', to: 'posts#destroy'
  resources :posts

end
