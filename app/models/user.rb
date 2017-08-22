class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, length: {minimum: 3}
  validates :password, presence: true, length: {minimum: 5}
  validates_confirmation_of :password
end
