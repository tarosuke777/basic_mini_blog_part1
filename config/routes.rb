Rails.application.routes.draw do
  root "articles#index"
  get 'articles/index'
  get 'articles/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
