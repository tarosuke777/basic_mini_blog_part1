Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: %i[show] 
  resources :relationships, only: %i[create destroy]

  root 'posts#index'
  get '/posts/following', to: 'posts#following'
  resources :posts
end
