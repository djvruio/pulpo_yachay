Rails.application.routes.draw do
  
  

  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :projects do
  	resources :memberships
  	resources :tasks
  end
  
end
