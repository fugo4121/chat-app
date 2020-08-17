Rails.application.routes.draw do
  devise_for :users
  # get 'messages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # / ルート への遷移先
  root "messages#index"

  resources :users, only: [:edit, :update]

  
end
