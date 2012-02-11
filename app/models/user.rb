class User < ActiveRecord::Base
  has_many :schools
  
  ############################# AUTHENTICATION ####################################

  def apply_omniauth(omniauth)
    self.name = omniauth['user_info']['name'] if name.blank?
    puts "applying , with selfid = " + self.id.to_s
    Authentication.create!(:user_id => self.id,
                          :provider => omniauth['provider'], 
                          :uid => omniauth['uid'],
                          :token => (omniauth['credentials']['token'] rescue nil))
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
