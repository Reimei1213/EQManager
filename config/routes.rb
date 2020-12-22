Rails.application.routes.draw do

  resources :borrows
  resources :equips
  get '/login' => "sessions#sessions.new"
  post "/login" => "sessions#create"
  delete '/logout' => 'sessions#destroy'

  resources :classifications
  resources :users
  resources :groups
  resources :group_user

  # get '/' => "home#index"
  root 'home#index'
  get "/account" => "home#account"
  get "/add" => "home#add"
  get "/equip_list" => "home#equip_list"
  get "/history" => "home#history"

  get "/equipment/new" => "equipment#new"
  get "/equipment" => "equipment#index", as: :equipment_index_path

end