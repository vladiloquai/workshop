Workshop::Application.routes.draw do
  devise_for :users

  resources :users
  resources :incidents

  root :to => 'incidents#index'
end
