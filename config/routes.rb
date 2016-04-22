Rails.application.routes.draw do
  root 'application#login'
  get 'mail/index'
  get 'authorize' => 'auth#gettoken'
  get 'login' => 'application#login'
  get 'meetings' => 'meetings#index'
  get 'meeting_show_filter' => 'meetings#show_filter'
  resources :notes, only: [:destroy]
  resources :meetings do
    resources :notes
  end
end
