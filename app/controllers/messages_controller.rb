class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.create!(params[:message])
    @chan_id = params[:message][:chan_id]
  end
end
