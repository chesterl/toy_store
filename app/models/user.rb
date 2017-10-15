class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :seller
  has_many :orders

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def is_a_seller?
    seller.present? && seller.persisted?
  end

end
