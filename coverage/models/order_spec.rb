require "rails_helper"

RSpec.describe Order, :type => :model do 
	describe "validations" do 
		it { should validate_presence_of :total }
		it { should validate_presence_of :date_delivery }
		it { should validate_presence_of :address }
	end

	describe "associations" do 
		it { should have_many :order_items }
		it { should belong_to :user }
	end

	describe "db schema" do 
		context "columns" do 
			it { should have_db_column(:total).of_type :decimal }
			it { should have_db_column(:status).of_type :integer }
			it { should have_db_column(:date_delivery).of_type :date}
		end
	end
end