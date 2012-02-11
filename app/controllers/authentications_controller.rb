class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if user_signed_in?
  end
  
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

  protected

  def handle_unverified_request
    true
  end
end
