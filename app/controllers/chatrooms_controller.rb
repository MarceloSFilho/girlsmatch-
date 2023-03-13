class ChatroomsController < ApplicationController

 # def create
 #   @chatroom = Chatroom.create!(params)
 # end

  def show
    @chatroom = Chatroom.find(params[:id])
    # achar a mentoria exata do usuario e o mentor
    @message = Message.new
  end
end
