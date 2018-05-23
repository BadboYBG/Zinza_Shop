require "rails_helper"

RSpec.describe CategoriesController, type: :controller do 
	let! :category1 {Fabricate.create :category }

	describe "GET #show" do
		subject {get :show, params: {id: id, page: page}} 

		context "return http" do 
			let :page {}

			# let :id {1}
			# it "success" do 
			# 	subject
			# 	expect(response).to have_http_status :success
			# end

			let :id {-1}
			it "redirect to root when not found category" do 
				subject
				expect(response).to redirect_to root_url
			end

		end

		context "return @products" do 
			let :id{1}

			let :page{}
			it "success" do 
				subject
				expect(assigns :products).to be_truthy
			end

			let :page {987654321}
			it "size page too big" do 
				subject
				expect(assigns :products).to eq []
			end

			let :id {category1.id}
			let :page{}
			it "id is correct, but no product" do 
				subject
				expect(assigns :products).to eq []
			end
			
		end
	end
end