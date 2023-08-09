Rails.application.routes.draw do
  devise_for :users
  resources :tweets do
    resources :comments
  end
  resources :comments
  root "tweets#index"
end
