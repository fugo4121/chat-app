Rails.application.routes.draw do
  get 'messages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # / ルート への遷移先
  root "messages#index"
end
