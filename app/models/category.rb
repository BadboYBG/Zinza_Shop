class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def name_with_initial
    "#{name}"
  end

end
