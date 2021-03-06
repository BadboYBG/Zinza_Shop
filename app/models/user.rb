class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy

  VALID_PHONE_REGEX = /\A((\+841|01)[2689]|(\+849|09))[0-9]{8}\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :address, presence: true
  validates :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }

  mount_uploader :avatar, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  scope :list_prodcts, -> {joins(:products)}
  scope :get_user, ->(id){where id: id}

  def customers
    ordered_products =  products.includes(:orders).select{|product| product.orders.present?}
    user_ids = ordered_products.map(&:orders).flatten.map(&:user_id).uniq
    User.where(id: user_ids)
  end
end
