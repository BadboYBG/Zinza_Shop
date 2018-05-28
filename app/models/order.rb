class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  validates :total, presence: true
  validates :date_delivery, presence: true
  validates :address, presence: true
  enum status: { active: 0, pending: 1 }
end
