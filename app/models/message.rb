class Message < ApplicationRecord
  belongs_to :from, class_name: "User", foreign_key: :from_id
  belongs_to :to, class_name: "User", foreign_key: :to_id

  validates :content, presence: true
  validates :from, presence: true
  validates :to, presence: true
end
