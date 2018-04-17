Rails.application.routes.draw do

  root to: 'blogs#top'
  resources :blogs do
    collection do
      post :confirm
      get :top
    end
  end

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
