class Micropost < ActiveRecord::Base
  
  #content :string
  #user_id :integer
  
  attr_accessible :content
  
  belongs_to :user
  
  validates :content, :presence => true, 
                              :length => {:maximum => 140 }
  validates :user_id, :presence => true
  
  default_scope :order => 'microposts.created_at DESC'
end
