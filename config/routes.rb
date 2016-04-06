Rails.application.routes.draw do
  root 'meetings#index'
  resources :meetings
  resources :notes
  resources :meetings do
    resources :notes
  end
end
