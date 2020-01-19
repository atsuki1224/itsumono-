Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  get "homes/index" => "homes#index"
  get "groups/index" => "groups#index"
  # get "groups/:id/edit" => "groups#edit"
  delete "groups/:id" => "groups#destroy"
  resources :groups
end
