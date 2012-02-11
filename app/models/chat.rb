class Chat < ActiveRecord::Base
  belongs_to :channel
  belongs_to :user
end
