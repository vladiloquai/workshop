Workshop::Application.routes.draw do
  resources :categories


  devise_for :users

  resources :users

  resources :incidents, :except => [ :create ] do
  	post "create" => "incidents#create", :as => :create, :path => 'new', :on => :collection
	end

  root :to => 'incidents#index'
end
