Rails.application.routes.draw do
  root 'meetings#index'
  get 'mail/index'
  get 'authorize' => 'auth#gettoken'
  get 'login' => 'application#home'
  resources :meetings do
    resources :notes
  end
end
