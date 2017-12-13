Rails.application.routes.draw do
  resources :messages
  resources :users

  mount ActionCable.server => '/cable'
end
