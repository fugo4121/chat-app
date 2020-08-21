class RoomsController < ApplicationController

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    # 保存を正常終了した場合ルートパスへ、失敗した場合ルームとユーザー情報を引き継いでルーム作成画面へ
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  # ルームのカラム許可、user_idsは同じルームの複数userをキーとして中間テーブルに保存
  # user_ids:のデータは配列のため、[]とすることで配列データを許可
  def room_params
    params.require(:room).permit(:name, user_ids:[])
  end


end
