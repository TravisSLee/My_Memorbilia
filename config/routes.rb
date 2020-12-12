Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  root to: 'application#welcome'
  
  resources :memorabilias 
  resources :athletes do 
    resources :memorabilias
  end
  get 'memorabilias/search_term/:search_term', to: 'memorabilias#index'
 

  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: 'login' 
    get 'signup', to: 'devise/registrations#new', as: 'signup'
  end
end
