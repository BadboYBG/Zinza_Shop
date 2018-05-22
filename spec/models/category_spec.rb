require "rails_helper"

RSpec.describe Category, :type => :model do
	
	describe "validations" do 
		it {should validate_presence_of :name }
		it {should validate_uniqueness_of :name }
	end

	describe "associations" do
		it {should have_many :products }
	end

	describe "db schema" do
		context "columns" do 
			it {should have_db_column(:name).of_type :string}
		end
	end

end