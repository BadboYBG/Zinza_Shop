class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy, autosave: true
  #has_many :products, through: :order_items

  validates :total, presence: true
  validates :date_delivery, presence: true
  validates :address, presence: true

  enum status: { active: 0, pending: 1 }

  def create_order_items(items, user)
    return unless items.present?
    items.each do |key, val|
      product = Product.find_by(id: key.to_i)
      next unless product.present?
      order_items.build(
        number: val.to_i,
        price: product.price,
        product: product,
      )
    end
  end
end
