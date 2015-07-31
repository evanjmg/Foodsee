Rails.application.routes.draw do
  devise_for :users, :controllers => { sessions: "users/sessions", :omniauth_callbacks => "users/omniauth_callbacks"}
 root 'users#index'
 
end
