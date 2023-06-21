Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root 'static_pages#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :posts, only: %i[new create index] do
    collection do
      get :likes
    end
  end
  resources :likes, only: %i[create destroy]
end
