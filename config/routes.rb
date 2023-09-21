Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items  # すべてのRESTfulなアクションを許可
end