class Channel < ActiveRecord::Base
  # associations
  belongs_to :school
  
  # validations
  validates :name, :uniqueness => true
end
