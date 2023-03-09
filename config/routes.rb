Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/users/:id", to: "users#show"
  get "mentorships", to: "mentorships#index"
  get "my_proposals", to: "mentorships#my_proposals"
  get "skills/new", to: "skills#update"
end
