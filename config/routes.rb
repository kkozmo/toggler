Rails.application.routes.draw do

  get 'users/new'
  root 'pages#home'
  get  "event" => 'pages#event'
  get "tournaments" => 'pages#tournaments'
  resources :users 
end
