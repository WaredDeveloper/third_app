Rails.application.routes.draw do

  get 'password_resets/new'
  get 'password_resets/edit'
  get 'session/new'
  get 'user/new'
  get 'users_cloud/new'
  get 'users/new'
  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'

  resources :micropost do
    member do
      put "like" => "microposts#like"
    end
  end
  resources :micropost do
    resources :comments
  end

  resources :relationships
  resources :users do # вывод всех методов действий для ресурса Users
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
