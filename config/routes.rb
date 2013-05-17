ORMMini::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :comments
  resources :user_requests, :path => '/supports'
  match '/users/changeRole', :controller => 'users', :action => 'changeRole'
  match '/statuses', :controller => 'statuses', :action => 'index'
  match '/statuses/change', :controller => 'statuses', :action => 'change'
  match '/statuses/create', :controller => 'statuses', :action => 'create'
  match '/statuses/delete', :controller => 'statuses', :action => 'delete'
  match "/tickets/:page", :controller => 'tickets', :action => 'index'
  match "/tickets", :controller => 'tickets', :action => 'index'
  match "/answer/:page", :controller => 'answer', :action => 'index'
  match '/statuses/close_ticket', :controller => 'statuses', :action => 'close_ticket'
  #match "/answer/_form_comment", :controller => 'answer', :action => 'add_comment'
  #match "/supports", :controller => 'user_requests', :action => 'index'
end