class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :order_items
  has_many :orders, through: :order_items

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :sale, presence: true
  validates :number, presence: true
  validates :detail, presence: true
  validate :picture_size

  mount_uploader :image, ImageUploader

  scope :list_product, -> { select :id, :name, :price, :image, :sale, :category_id }
  scope :check_number_product, -> { where 'number > 0' }

  def get_order_id()
    order_items
  end

  private

  def picture_size
    errors.add(:picture, 'should be less than 5MB') if image.size > 5.megabytes
  end
end
