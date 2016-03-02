class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates_uniqueness_of :name #no other name exits in database
  validates_presence_of :name, :password
end
