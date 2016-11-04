Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'welcome/index'
  root 'welcome#index'
 
  resources :feeds 
  post :send_request_mail, to: 'feeds#send_request_mail', as: :send_request_mail
  # get 'autocomplete_user_email' => "feeds#autocomplete_user_email"

  get 'profile' => "feeds#profile"
  #get 'auth/facebook/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect('/')
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  resources :friendships
  resources :bookmarks
end
  
