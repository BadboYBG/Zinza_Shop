require "rails_helper"

RSpec.describe ProductsController, type: :controller do 
	let! :category1 {Fabricate.create :category }
  let!:product1 { Fabricate.create :product, category_id: category1.id }

	
	describe "GET #show" do
		subject { get :show, params: {id: id}}

		context "return http success" do
		let :id {product1.id}
			it do 
				subject
				expect(response).to have_http_status :success
			end
		end

		context "return http success" do 
			let :id {product1.id + 1}
			it do 
				subject
				expect(response).to redirect_to root_path
			end
		end

	end

	describe "GET #index" do  
		subject { get :index }

		context "" do 
		end
	end
	
end
