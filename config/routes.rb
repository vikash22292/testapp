Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users

  resources :todo_lists do
    member do
      patch :update_status
    end
  end
end
