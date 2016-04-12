Rails.application.routes.draw do
  root 'application#login'
  get 'mail/index'
  get 'authorize' => 'auth#gettoken'
  get 'login' => 'application#login'
  resources :notes, only: [:destroy]
  resources :meetings do
    resources :notes
  end
end
