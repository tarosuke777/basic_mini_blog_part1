Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resources :users, only: %i[show] do
    resources :relationships, only: %i[create destroy]
  end

  root 'articles#index'
  get '/articles/following', to: 'articles#following'
  resources :articles
end
