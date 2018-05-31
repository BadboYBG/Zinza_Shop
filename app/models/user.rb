class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  VALID_PHONE_REGEX = /\A((\+841|01)[2689]|(\+849|09))[0-9]{8}\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :address, presence: true
  validates :name, presence: true
  mount_uploader :avatar, ImageUploader
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
