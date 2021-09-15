Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/home/about" => "homes#about"
  resources :books,only:[:create,:index,:show,:edit,:update,:destroy] do
    resource :favorite,only:[:create,:destroy]
    resources :book_comments,only:[:create,:destroy]
  end
  resources :users,only:[:index,:show,:edit,:update] do
    resource :relationship, only:[:create,:destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  get "search" => "searches#search"
end
