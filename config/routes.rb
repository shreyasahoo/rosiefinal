Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :journals


  authenticated :user do
  	root 'journals#index', as: "authenticated_root"
  end
  
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
