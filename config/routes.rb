Rails.application.routes.draw do
  devise_for :users
  resources :topics

  root 'topics#index'
end
