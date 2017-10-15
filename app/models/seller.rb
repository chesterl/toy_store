class Seller < ApplicationRecord
  belongs_to :user
  has_many :toys
  has_many :orders
  #alternate has_many :orders, through: toys
  validates :name, presence: true
end
