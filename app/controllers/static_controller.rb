class StaticController < ApplicationController
  def home 
    if false #user_signed_in?
      #redirect_to 
    else
      render :layout => false
    end
  end
end
