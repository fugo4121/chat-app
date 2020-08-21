class MessagesController < ApplicationController

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    # roomごとに紐づくmessageを取得し、user情報も紐づける
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      # messageを保存できなかった時、index.html.erbに情報を保持
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private


  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

end
