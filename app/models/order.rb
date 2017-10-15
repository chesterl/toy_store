class Order < ApplicationRecord
  belongs_to :user
  belongs_to :toy
  belongs_to :seller

  validates :user, presence: true
  validates :toy, presence: true
  validates :seller, presence: true
end
