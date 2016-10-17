Rails.application.routes.draw do
  
  # devise_for :users #do 
  #    get :autocomplete_user_email, on: :collection
  # end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'welcome/index'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'welcome#index'
 
  resources :feeds do
    get 'bookmarks', on: :collection
    put 'bookmark_the_feed', on: :member
    get 'profile', on: :collection
    # autocomplete :user, :email, :full => true
  end 
    
  resources :friendships
   

end

 


  
  


  
