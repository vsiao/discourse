class Channel < ActiveRecord::Base
  # associations
  belongs_to :school
  has_many :users
  
  # validations
  validates :name, :uniqueness => true
end
