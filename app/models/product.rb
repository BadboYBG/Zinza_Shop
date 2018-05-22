class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :sale, presence: true
  validates :number, presence: true
  validates :detail, presence: true
  validates :image, presence: true

  scope :list_product, ->{select :id, :name, :price, :image, :sale, :category_id}
  scope :check_number_product, ->{where "number > 0" }
end
