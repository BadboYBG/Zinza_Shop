class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :sale, presence: true
  validates :number, presence: true
  validates :detail, presence: true
  mount_uploader :image, ImageUploader
  validate :picture_size

  scope :list_product, -> { select :id, :name, :price, :image, :sale, :category_id }
  scope :check_number_product, -> { where 'number > 0' }

  private

  def picture_size
    errors.add(:picture, 'should be less than 5MB') if image.size > 5.megabytes
  end

end
