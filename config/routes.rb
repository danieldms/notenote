Notenote::Application.routes.draw do
  
  devise_for :users
  
  get "welcome/index"

  authenticated :user do
  	root "notes#index", as: "authenticated_root"
  end
  
  root "welcome#index"

  resources :notes

end
