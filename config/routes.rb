Rails.application.routes.draw do

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout", sign_up: "signup"},
                     controllers: { omniauth_callbacks: "omniauth_callbacks"}
  
  root 'pages#home'
  
  get 'pages/home', to: 'pages#home'
  resources :users, only: [:show]

end
