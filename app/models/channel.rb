class Channel < ActiveRecord::Base
  # associations
  belongs_to :school
  has_many :chats
  has_many :users, :through => :chats
  
  # validations
  validates :name, :uniqueness => true
  
    
  def check_active_users
    self.users.each do |u|
      c = Chat.find_by_user_id_and_channel_id(u.id, self.id)
      if (Time.now - c.updated_at) > 3
        self.users.delete(u)
      end
    end
  end
end
