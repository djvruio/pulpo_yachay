Rails.application.routes.draw do

  resources :states

  resources :goals

  resources :organizations

  resources :statistics

  #root to: 'visitors#index'
  root to: 'statistics#show'
  #root to: 'projects#index'

  devise_for :users
  resources :users

  # %w(open close suspended).each do |scope|
  #   get "projects/#{scope}" => "projects#index", scope: scope
  # end

  get "projects/filter/:scope" => "projects#index", as: :filtered_projects
  get "statistics/show", as: :show_statistics


  resources :projects do
    resources :memberships
    resources :alignmentse
    resources :tasks
  end
  
end
