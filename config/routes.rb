Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  root to: 'application#welcome'
  get 'memorabilias/search_term/:search_term', to: 'memorabilias#index'
  resources :memorabilias 
  resources :athletes, execpt: [:edit, :update, :destroy] do 
    resources :memorabilias
  end
  
 

  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: 'login' 
    get 'signup', to: 'devise/registrations#new', as: 'signup'
  end
end
