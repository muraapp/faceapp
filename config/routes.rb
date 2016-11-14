Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :topics do
    resources :comments
  end

  root 'topics#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :conversations do
    resources :messages
  end

  resources :users, only: [:index]

  resources :relationships, only: [:create, :destroy]



end
