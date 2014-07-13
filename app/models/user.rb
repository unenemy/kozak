class User < ActiveRecord::Base
  include Authenticable

  has_many :tokens

  validates_presence_of :email
  validates_uniqueness_of :email
end
