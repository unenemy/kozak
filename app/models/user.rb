class User < ActiveRecord::Base
  include Authenticable

  enum role: [ :user, :admin ]

  has_many :tokens

  validates_presence_of :email
  validates_uniqueness_of :email

  scope :all_except, ->(user){ where.not(id: user.id) }
end
