Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
   }  
   devise_scope :user do
    post '/users/sign_up', to: 'users/registrations#create'
    put '/users/edit', to: 'users/registrations#update'
  end

  resources :users, only: %i[show] 
  resources :relationships, only: %i[create destroy]

  root 'posts#index'
  get '/posts/following', to: 'posts#following'
  resources :posts
end
