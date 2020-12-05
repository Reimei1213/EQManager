Rails.application.routes.draw do

    get '/login' => "sessions#sessions.new"
    post "/login" => "sessions#create"
    delete '/logout' => 'sessions#destroy'

    resources :classifications
    resources :users
    resources :groups

    get '/' => "home#index"
    get "account" => "home#account"
    get "add" => "home#add"

end