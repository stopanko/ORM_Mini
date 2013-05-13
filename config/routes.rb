ORMMini::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  match '/users/changeRole', :controller => 'users', :action => 'changeRole'
  match '/statuses/change', :controller => 'statuses', :action => 'change'
  match '/statuses/create', :controller => 'statuses', :action => 'create'
  match '/statuses/delete', :controller => 'statuses', :action => 'delete'
  get "/tickets/:page" => "tickets#show"
  match '/statuses', :controller => 'statuses', :action => 'index'
end