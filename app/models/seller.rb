class Seller < ApplicationRecord
  belongs_to :user
  has_many :toys
  has_many :orders
  #alternate has_many :orders, through: toys
  validates :name, :street, :state, :suburb, :postcode, :country, presence: true

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    [street, suburb, state, postcode, country].compact.join(',')
  end
end
