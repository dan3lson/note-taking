Rails.application.routes.draw do
  root 'meetings#index'
  resources :meetings
  resources :notes, except: [:new, :create]
  resources :meetings do
    resources :notes
  end
end
