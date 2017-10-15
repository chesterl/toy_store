class Toy < ApplicationRecord
  belongs_to :seller

  validates :name, presence: true, length: { minimum: 5 }
  validates :price, presence: true, numericality: { greater_than: 1 }
  validates :description, presence: true, length: { minimum: 30 }

  mount_uploader :image, ImageUploader

  scope :name_like, -> (name) { where("name like ?", "%#{name}%")}
  scope :description_contains, -> (description) { where("description like ?", "%#{description}%")}
  scope :price_greater_than, -> (price) { where("price > ?", price) }
  scope :price_less_than, -> (price) { where("price < ?", price) }
end
