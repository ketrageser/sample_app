#id :integer
#name :string
#email :string
#created_at :datatime
#updated_at :datatime

class User < ActiveRecord::Base
  attr_accessible :name, :email
end
