class User < ActiveRecord::Base
  has_many :maps
  has_many :comments

end
