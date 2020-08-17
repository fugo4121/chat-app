Rails.application.routes.draw do
  devise_for :users
  # get 'messages/index'

  # ユーザー情報変更画面
  # edit_user_path	GET	/users/:id/edit(.:format)	users#edit
  
  
  # / ルート への遷移先
  root "messages#index"

  resources :users, only: [:edit, :update]

  
end
