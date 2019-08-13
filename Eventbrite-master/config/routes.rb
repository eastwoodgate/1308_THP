Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/index'
  get 'static_pages/secret'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "events#index", :id => '1'
  resources :events
  resources :users, only: [:show, :edit, :update]
end
