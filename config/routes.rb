Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :messages
      resources :users
      resources :boards
      resources :board_users
      resources :media

      match "/media/:id/change", to: "media#change", via: [:get, :patch]
      match "/update_board_positions", to: "board_users#change", via: [:patch]

      post "/auth", to: "sessions#create"
      get "/current_user", to: "sessions#show"
    end
  end

  mount ActionCable.server => '/cable'
end
