class Public::MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id

    if @message.save
      redirect_to room_path(@message.room_id)
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
      redirect_back(fallback_location: root_path) # エラー時に元のページに戻る
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :room_id)
  end
end

