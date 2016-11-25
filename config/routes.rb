Rails.application.routes.draw do

  resources :groups, only: [:index, :show]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
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

  resources :users, only: [:index] do
    collection do
      get 'groups'
    end
  end

  resources :relationships, only: [:create, :destroy]



end
