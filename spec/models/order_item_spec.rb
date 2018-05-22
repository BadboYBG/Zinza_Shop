require "rails_helper"

RSpec.describe OrderItem, :type => :model do 
	describe "validations" do 
		it { is_expected.to validate_presence_of :number }
		it { is_expected.to validate_presence_of :price }
	end

	describe "associations" do 
		it { is_expected.to belong_to :order }
		it {is_expected.to belong_to :product }
	end

	describe "db schema" do
		context "columns" do  
			it { is_expected.to have_db_column(:number).of_type :integer }
			it { is_expected.to have_db_column(:price).of_type :decimal }
		end
	end

end
