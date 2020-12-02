Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', :omni_auth_callbacks => 'callbacks' }
  root to: 'application#welcome'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: 'login' 
    get 'signup', to: 'devise/registrations#new', as: 'signup'
    # delete 'logout', to: 'devise/sessions#destroy', as: 'logout'
  end
end
