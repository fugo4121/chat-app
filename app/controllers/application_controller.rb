class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # deviseのコントローラーから呼び出された場合、devise_parameter_sanitizer呼び出し
  before_action :configure_permitted_parameters, if: :devise_controller?

  # private ここから下のメソッドは、クラス外から呼び出すことのできない
  # protected privateと同じでかつ、同じインスタンス内で呼び出しができる
  protected

  def configure_permitted_parameters
    # deviseでユーザーを登録時に使用でき、nameのカラムを許容する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
