Rails.application.routes.draw do
  get 'search/new'

  get 'search/index'

  devise_for :users, :skip => [:sessions], :controllers => {  :omniauth_callbacks => "users/omniauth_callbacks"}
  # get 'users/index', to: "users#index", as: 'users' 
  devise_scope :user do
 
    authenticated :user do
      root 'search#index', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end

end
