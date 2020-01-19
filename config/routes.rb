Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  get "homes/index" => "homes#index"
  get "groups/index" => "groups#index"
  delete "groups/:id" => "groups#destroy"
  get "groups/:id/posts/index" => "posts#index"
  resources :groups
  resources :posts
end
