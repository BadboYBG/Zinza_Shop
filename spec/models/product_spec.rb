require "rails_helper"

RSpec.describe Product, :type => :model do 
	describe "validations" do 
		it { is_expected.to validate_presence_of :name }
		it { is_expected.to validate_uniqueness_of :name }
		it { is_expected.to validate_presence_of :price }
		it { is_expected.to validate_presence_of :sale }
		it { is_expected.to validate_presence_of :number }
		it { is_expected.to validate_presence_of :detail }
		it { is_expected.to validate_presence_of :image }
	end

	describe "associations" do 
		it { is_expected.to belong_to :category }
	end

	describe "db schema" do
		context "columns" do  
			it { is_expected.to have_db_column(:name).of_type :string }
			it { is_expected.to have_db_column(:price).of_type :decimal }
			it { is_expected.to have_db_column(:sale).of_type :integer }
			it { is_expected.to have_db_column(:number).of_type :integer }
			it { is_expected.to have_db_column(:detail).of_type :string }
			it { is_expected.to have_db_column(:image).of_type :string }
		end
	end

end
