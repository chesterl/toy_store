class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :seller, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :sent_messages, class_name: "Message", foreign_key: "from_id"
  has_many :received_messages, class_name: "Message", foreign_key: "to_id"

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def is_a_seller?
    seller.present? && seller.persisted?
  end

end
