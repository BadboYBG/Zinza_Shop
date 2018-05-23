require "rails_helper"

RSpec.describe ProductsController, type: :controller do 

	let! :product { Fabricate.create}

	context "GET Show" do 
		it "assigns a blank category to the view" do 
			get :new 
			expect(assigns :category).to be_a_new Category
		end
	end
end
