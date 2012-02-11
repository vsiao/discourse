class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create!(params[:message])
    @channel_name = params[:message][:channel_name]
  end
end
