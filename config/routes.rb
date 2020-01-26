Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  get "homes/index" => "homes#index"
  get "homes/how_to_use" => "homes#how_to_use"
  get "groups/index" => "groups#index"
  delete "groups/:id" => "groups#destroy"
  get "groups/:id/posts/index" => "posts#index"
  post "/posts" => "posts#create"
  get "groups/:id/posts/:id/edit" => "posts#edit"
  get "groups/:id/posts/:id/destroy" => "posts#destroy"
  resources :groups
  resources :posts
end
