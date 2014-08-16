class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
         #:recoverable, :rememberable, :trackable, :validatable
  has_many :articles

  validates :name, presence:true
  validates :email, presence:true, format:{ with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: true
end
