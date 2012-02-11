class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if user_signed_in?
  end

  #### OLD STUFF
  #
  #
#		# Updated the imported schedule with the correct user id, and make it active
#		if session[:imported]
#			imported_schedule = Schedule.find(session[:imported])
#      user.update_active_schedule(imported_schedule)
#      
#      session[:imported] = nil
#		end
#
#    render :text => '<script type="text/javascript">if(window.opener){window.opener.location.reload(true);window.close();}else{window.location("/schedules");}</script>', :layout => false
#    #redirect_to schedules_url
  #
  #
  #################

  def create
    omniauth = request.env['omniauth.auth']
    auth = Authentication.find_by_provider_and_uid(omniauth['provider'], 
                                                   omniauth['uid'])
    if auth
      flash[:notice] = "Signed in successfully."
      auth.update_attribute(:token, (omniauth['credentials']['token'] rescue nil))
      session[:user_id] = auth.user.id
      redirect_to '/channels'
    elsif user_signed_in?
      current_user.authentiation.update_attribute(:token, (omniauth['credentials']['token'] rescue nil))
      flash[:notice] = "Authentication successful."
      redirect_to '/channels'
    else
      user = User.new
      user.save
      user.apply_omniauth(omniauth)
      user.save
      
      flash[:notice] = "Signed in successfully."
      session[:user_id] = user.id
      redirect_to '/channels'
    end
  end

  def destroy
    current_user.authentication.update_attribute(:token, nil)
    redirect_to root_url
  end
  
  # user cancelled facebook authentication. we do nothing.
  #def bounce
 #   render :text => '<script type="text/javascript">if(window.opener){window.close();}</script>', :layout => false
#  end

  protected

  def handle_unverified_request
    true
  end
end
