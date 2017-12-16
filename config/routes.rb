Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :messages
      resources :users
      resources :boards
      resources :board_users

      post "/auth", to: "sessions#create"
      get "/current_user", to: "sessions#show"
    end
  end

  mount ActionCable.server => '/cable'
end
