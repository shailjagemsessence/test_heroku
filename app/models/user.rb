class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :feeds
  validates :contact_no, numericality: { only_integer: true }
  validates_uniqueness_of :contact_no, :message => 'contact_no has already been taken'
end

  
