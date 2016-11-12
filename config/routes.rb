Rails.application.routes.draw do
  devise_for :users
  resources :plants do
    resources :reviews
  end
  root 'plants#index'
end
