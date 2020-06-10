Rails.application.routes.draw do

  post 'login', to: 'authentication#authenticate'
  post 'new', to: 'posts#create'
  post 'signup', to: 'user#create'
  patch 'edit', to: 'posts#update'
  resources :posts

end
