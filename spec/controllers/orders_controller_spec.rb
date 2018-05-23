require "rails_helper"
RSpec.describe OrdersController, type: :controller do 
  #login_user
  let! :user { Fabricate.create :user, name: "Minh",
    phone: "0975640110",
    address: "BG",
    image: "product-01.jpg",
    email: Faker::Internet.email,
    password: "123456",
    password_confirmation: "123456",
    confirmed_at: Date.today }

  before { sign_in user }

  let! :order1 { Fabricate.attributes_for :order, address: "BG", date_delivery: "01/10/1994",
    total: 2, user_id: user.id.to_i }

	describe "POST #create" do
	 subject {post :create, params: {order: order}}
		
	  context "with valid attributes" do

	  	let :order { order1 }
	  	it "create new order" do
        expect{subject}.to change { Order.count }.by 1
      end

      it "new OrderItem" do 
        expect{subject}.to change {OrderItem.count}.by 1
      end

      it "return http success" do 
      	subject
      	expect(response).to redirect_to root_url
      end
	  end

    context "save order fail" do 
      let! :or1 {Fabricate.attributes_for :order, address: "", date_delivery: "01/10/1994",
        total: 2, user_id: user.id.to_i}
      let :order {or1}
        it do 
          subject
          expect(response).to redirect_to carts_path
        end
    end
	end

  describe "GET #show" do 
    subject {get :show, params: {page: page}}
    context "return http success " do 
      let :page {1}
      it do 
        subject
        expect(response).to have_http_status 200
      end
    end
  end
end