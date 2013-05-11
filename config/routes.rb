ORMMini::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  match '/users/changeRole', :controller => 'users', :action => 'changeRole'
end