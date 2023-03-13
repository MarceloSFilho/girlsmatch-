class ChatroomsController < ApplicationController

  def create
    @chatroom = Chatroom.new(params[:student_id,:mentor_id])
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    # achar a mentoria exata do usuario e o mentor
    @message = Message.new
  end
end
