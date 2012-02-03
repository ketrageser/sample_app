class Micropost < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  
  validates :content, :presense => true, :length => {:maximum => 140 }
  validates :user_id, :presense => true
  
  default_scope :order => 'microposts.created_at DESC'
end
