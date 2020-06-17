Rails.application.routes.draw do
  # get 'yoga_classes/index'
  # get 'yoga_classes/new'
  # get 'yoga_classes/create'
  # get 'yoga_classes/edit'
  # get 'yoga_classes/update'
  # get 'yoga_classes/delete'
  resources :yoga_classes
  resources :studios
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks => 'callbacks'}

  root to: 'application#welcome'
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new', as: 'login'
    get 'signup', to: 'devise/registrations#new', as: 'signup'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end 


end
