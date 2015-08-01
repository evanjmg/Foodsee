Rails.application.routes.draw do
  get 'search/new'

  get 'search/index'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  devise_for :users, :controllers => {  :omniauth_callbacks => "users/omniauth_callbacks"}
  # get 'users/index', to: "users#index", as: 'users' 
  devise_scope :user do
 
    authenticated :user do
      root 'search#index', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end
  resources :users, only: [:index, :show]
  
end
