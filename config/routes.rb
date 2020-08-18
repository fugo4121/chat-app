Rails.application.routes.draw do
  devise_for :users
  # get 'messages/index'

  # 新規アカウント作成画面
  # app/views/registrations/new.html.erb

  # ユーザー情報変更画面
  # edit_user_path            GET     /users/:id/edit(.:format)	users#edit
  # app/views/users/edit.html.erb

  # ユーザーログアウト
  # destroy_user_session_path	DELETE  /users/sign_out(.:format)	devise/sessions#destroy
  # app/views/users/edit.html.erb
  
  # / ルート への遷移先
  root "messages#index"

  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
  
end
