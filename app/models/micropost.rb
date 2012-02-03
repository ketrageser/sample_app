class Micropost < ActiveRecord::Base
  
  #content :string
  #user_id :integer
  
  attr_accessible :content
  
  belongs_to :user
  
  validate :content, :presense => true, 
                              :length => {:maximum => 140 }
  validate :user_id, :presense => true
  
  default_scope :order => 'microposts.created_at DESC'
end
