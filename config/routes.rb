Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'welcome/index'
 
  root 'welcome#index'

  resources :feeds do
    get 'bookmarks', on: :collection
    put 'bookmark_the_feed', on: :member
  end 
end
