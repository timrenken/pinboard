class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pins, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  acts_as_voter
  
  validates_presence_of :username
  validates_uniqueness_of :username
end
