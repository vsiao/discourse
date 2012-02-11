class User < ActiveRecord::Base
  belongs_to :authentication
  has_many :schools
  has_many :channels
  
  ############################# AUTHENTICATION ####################################

  def apply_omniauth(omniauth)
    self.name = omniauth['user_info']['name'] if name.blank?
    auth = Authentication.create!(:user_id => self.id,
                          :provider => omniauth['provider'], 
                          :uid => omniauth['uid'],
                          :token => (omniauth['credentials']['token'] rescue nil))
    self.authentication_id = auth.id
    self.uid = omniauth['uid']
  end

  def fb_uid
    self.authentication.token rescue nil
  end
  
  # fb_graph for a user
  def fb
    @fb_user ||= FbGraph::User.me(fb_uid).fetch
  end
 
  #################################################################################
end
