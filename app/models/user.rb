require 'bcrypt'

class User < ActiveRecord::Base
  has_many :projects
  has_many :skills

  has_secure_password
  validates :name, :email, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  
  
end
