Rails.application.routes.draw do
  get 'calendar/index'
  get 'mail/index'

  # root 'meetings#index'
  root 'application#home'
  get 'authorize' => 'auth#gettoken'
  resources :meetings do
    resources :notes
  end
end
