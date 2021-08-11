Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_in', to: 'users/sessions#new', as: :new_user_session
    post '/users/sign_in', to: 'users/sessions#create', as: :user_session
    delete '/users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
    get '/users/sign_up', to: 'users/registrations#new', as: :new_user_registration
    post '/users/sign_up', to: 'users/registrations#create', as: :user_registration
    get '/users', to: 'users/registrations#edit', as: :edit_user_registration
    put '/users', to: 'users/registrations#update', as: :update_user_registration
    delete '/users', to: 'users/registrations#destroy', as: :destroy_user_registration
  end

  resources :users, only: %i[show] 
  resources :relationships, only: %i[create destroy]

  root 'posts#index'
  get '/posts/following', to: 'posts#following'
  resources :posts
end
