Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  # Defines the root path route ("/")
  # root "articles#index"
  get "/profile", to: "users#profile", as: "profile"
  get "mentorships", to: "mentorships#index"
  get "my_proposals", to: "mentorships#my_proposals"

  resources :users do
    resources :mentorships, only: :create
  end
  resources :mentorships, only: [:update, :destroy]
  resources :skills
end
