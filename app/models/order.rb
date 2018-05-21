class Order < ApplicationRecord
	belongs_to :user

	validates :total, presence: true
	validates :date_delivery, presence: true
	validates :address, presence: true
	enum status: {active: 0, archived: 1}
end
