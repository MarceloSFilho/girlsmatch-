class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    # achar a mentoria exata do usuario e o mentor
    @message = Message.new
  end
end
