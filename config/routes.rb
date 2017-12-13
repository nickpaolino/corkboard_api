Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :messages
      resources :users

      post "/auth", to: "sessions#create"
    end
  end
  # get "/current_user", to: "sessions#show"

  mount ActionCable.server => '/cable'
end
