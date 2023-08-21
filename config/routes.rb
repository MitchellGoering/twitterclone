Rails.application.routes.draw do
  devise_for :users
  resources :tweets do
    post :like, on: :member
    delete :unlike, on: :member
    resources :comments
  end
  root "tweets#index"
end
