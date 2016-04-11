Rails.application.routes.draw do
  root 'meetings#index'
  resources :meetings do
    resources :notes
  end
end
