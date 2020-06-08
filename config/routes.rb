Rails.application.routes.draw do

    # get  'posts', to: 'posts#index'
    post 'login', to: 'authentication#authenticate'
    post 'new', to: 'posts#create'
    post 'signup', to: 'user#create'
 resources :posts
 # resources :user

end
