ORMMini::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  match '/users/changeRole', :controller => 'users', :action => 'changeRole'
  match '/statuses/changeStatus', :controller => 'statuses', :action => 'changeStatus'
  match '/statuses/createStatus', :controller => 'statuses', :action => 'createStatus'
  match '/statuses/deleteStatus', :controller => 'statuses', :action => 'deleteStatus'
  get "/tickets/:page" => "tickets#show"
  match '/statuses', :controller => 'statuses', :action => 'index'
end