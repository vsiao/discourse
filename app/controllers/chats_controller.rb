class ChatsController < ApplicationController
  
  def update
    @chat = Chat.find_by_channel_id_and_user_id(params[:id], current_user.id) || 
            Chat.create(:user_id => current_user.id, :channel_id => params[:id])

    respond_to do |format|
      format.html { redirect_to channel_path(@chat.channel) }
      format.js
    end
  end
  
  def destroy
    @chat = Chat.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to channels_path }
      format.js
    end
  end
end
