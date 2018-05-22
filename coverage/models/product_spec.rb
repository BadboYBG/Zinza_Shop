require "rails_helper"

RSpec.describe Product, :type => :model do 
	describe "validations" do 
		it { should validate_presence_of :name }
		it { should validate_uniqueness_of :name }
		it { should validate_presence_of :price }
		it { should validate_presence_of :sale }
		it { should validate_presence_of :number }
		it { should validate_presence_of :detail }
		it { should validate_presence_of :image }
	end

	describe "associations" do 
		it { should belong_to :category }
	end

	describe "db schema" do
		context "columns" do  
			it { should have_db_column(:name).of_type :string }
			it { should have_db_column(:price).of_type :decimal }
			it { should have_db_column(:sale).of_type :integer }
			it { should have_db_column(:number).of_type :integer }
			it { should have_db_column(:detail).of_type :string }
			it { should have_db_column(:image).of_type :string }
		end
	end

end
