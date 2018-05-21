class Product < ApplicationRecord
	#belongs_to :category

	scope :list_product, ->{select :id, :name, :price, :image, :sale, :category_id}
	scope :check_number_product, ->{where "number > 0" }
	scope :list_product_of_category, ->(id){where category_id: id}
end
