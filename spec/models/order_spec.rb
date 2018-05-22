require "rails_helper"

RSpec.describe Order, :type => :model do 
	describe "validations" do 
		it { is_expected.to validate_presence_of :total }
		it { is_expected.to validate_presence_of :date_delivery }
		it { is_expected.to validate_presence_of :address }
	end

	describe "associations" do 
		it { is_expected.to have_many :order_items }
		it { is_expected.to belong_to :user }
	end

	describe "db schema" do 
		context "columns" do 
			it { is_expected.to have_db_column(:total).of_type :decimal }
			it { is_expected.to have_db_column(:status).of_type :integer }
			it { is_expected.to have_db_column(:date_delivery).of_type :date}
		end
	end
end