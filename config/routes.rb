Rails.application.routes.draw do
  get 'restaurants_collections/index'

  get 'restaurants_collections/destroy'

  get 'restaurants_collections/create'

  get 'restaurants_collections/new'

 resources :image_collections, only: [:index, :new, :create, :destroy] 
 resources :images
match "/images/tag/:tag", to: "images#tag", :via => [:get], :as => :tag_images
  get 'users/my_account', to: "users#my_account", as: 'my_account' 
 resources :search, only: [:index, :new, :image_results]
  get 'tag', to: 'images#tag', as: 'tag'

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  devise_for :users, :skip => [:sessions], :controllers => {  :omniauth_callbacks => "users/omniauth_callbacks"}
  
  devise_scope :user do
    get 'login' => 'devise/sessions#new', :as => :new_user_session
    post 'login' => 'devise/sessions#create', :as => :user_session
    match 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session,
      :via => Devise.mappings[:user].sign_out_via
    authenticated :user do
      root 'search#index', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end
  resources :users, only: [:index, :show]
  
 
end
