require "rails_helper"

RSpec.describe OrderItem, :type => :model do 
	describe "validations" do 
		it { should validate_presence_of :number }
		it { should validate_presence_of :price }
	end

	describe "associations" do 
		it { should belong_to :order }
		it {should belong_to :product }
	end

	describe "db schema" do
		context "columns" do  
			it { should have_db_column(:number).of_type :integer }
			it { should have_db_column(:price).of_type :decimal }
		end
	end

end
