require "rails_helper"

RSpec.describe CartsController, type: :controller do 

	describe "GET #index" do 
		subject { get :index}
		context "new Order" do 
			it "new order" do
				subject
				expect(assigns(:order)).to be_a_new(Order) 
			end

			it "return https success" do 
				subject
				expect(response).to have_http_status :success
			end
		end

	end
	describe "POST #create" do 
		subject {post :create, params: {session: {product_id: id}}, flash: {}}

		context "check id_product" do 
			let :id {}
			it "check id_product blank" do 
				subject
				expect(flash[:danger]).to_not be_nil
			end
		end

		context do 
		let :id {1}
			it "check id_product not blank " do 
			  subject
			  expect(flash[:success]).to_not be_nil
			end
		end
	end
	describe "PATCH #update" do 
		subject {PATCH :update, params: {item: {id_product: id_product}}, flash: {}}

		 context "update number product in cart " do
		   let :id_product {2}
		   it do 
		   	subject
		   	expect(response).to_have_http_status 200
		   end 
		 end

	end
	describe "DELETE #destroy" do 
		subject {delete :destroy, params: {id: id}, flash: {}}
		
		context "return http success" do
			let :id {1} 
			it do 
				subject
				expect(response).to have_http_status :success
			end
		end
	end
end