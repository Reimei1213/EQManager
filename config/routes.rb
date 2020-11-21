Rails.application.routes.draw do
  get '/' => "home#top"
  get "account" => "home#account"
  get "add" => "home#add"
end
