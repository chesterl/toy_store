class Toy < ApplicationRecord
  belongs_to :seller

  validates :name, presence: true, length: { minimum: 5 }
  validates :price, presence: true, numericality: { greater_than: 1 }
  validates :description, presence: true, length: { minimum: 30 }

  mount_uploader :image, ImageUploader
end
