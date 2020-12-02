Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', :omni_auth_callbacks => 'callbacks' }
  root to: 'application#welcome'

  devise_scope :usser do
    get 'login', to: 'devise/sessions#new', as: 'login' 
  end
end
