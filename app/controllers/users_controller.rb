class UsersController < ApplicationController
  def edit
  end

  def update
    # 更新が正常に終わった場合、ルートを通してチャット画面に戻る(インスタンス変数が初期化される)
    # うまくいかない場合、そのままビューのeditに遷移(ビューにインスタンス変数を引継ぎ)
    # エラー時に、メールアドレスなどの入力フォームのデータを初期化させず、そのまま残しておいたままにする
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
