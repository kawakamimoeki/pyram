Rails.application.routes.draw do
  root "home#index"

  resources :users
  get "/users/:id/setting", to: "users#setting", as: :setting_user
  resources :invites, only: ["show", "new", "create"]

  resources :books do
    get "/budgets/edit", to: "budgets#edit", as: :edit_budget
    post "/budgets", to: "budgets#update", as: :update_budget
    resources :payments
    resources :tags
  end

  get "books/:id/setting", to: "books#setting", as: :setting_book
  get "books/:id/switch", to: "books#switch", as: :switch_book

  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  get "log_out", to: "sessions#destroy", as: "log_out"

  resources :sessions, only: %i[create destroy]
end
