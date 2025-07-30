class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :venues, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :bookings, dependent: :destroy

  def first_name_from_email
    email.split("@").first.capitalize
  end

  def admin?
    admin
  end
end
