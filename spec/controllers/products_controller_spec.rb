require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let!(:category1) { Fabricate.create :category }
  let!(:product1) { Fabricate.create :product, category_id: category1.id }
  describe 'GET #index' do
    subject { get :index, params: { page: page, limit: limit }, flash: {} }
    context 'return http success, all products' do
      let(:page) { 1 }
      let(:limit) { 6 }
      it do
        subject
        expect(response).to have_http_status :success
      end
    end

    context 'return no product' do
      let(:page) { 100_000_000_000 }
      let(:limit) { 6 }
      it ' when page too length' do
        subject
        expect(assigns(:products)).to eq []
      end
    end
  end

  describe 'GET #show' do
    subject { get :show, params: { id: id } }

    context 'return http success' do
      let(:id) { product1.id }
      it do
        subject
        expect(response).to have_http_status :success
      end
    end

    context 'redirect to root on invalid id' do
      let(:id) { (product1.id + 1) }
      it do
        subject
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'GET #search .ransack' do
    subject { get :search, params: { page: page, search: search } }

    context 'no page, no search' do
      let(:page) {}
      let(:search) {}

      it 'return http success' do
        subject
        expect(response).to have_http_status :success
      end

      it 'empety search => all product' do
        subject
        expect(assigns(:ps)).to_not be_nil
      end
    end

    context 'not find' do
      let(:page) {}
      let(:search) { 'MinhMinh123456789' }
      it 'havs not product' do
        subject
        expect(assigns(:ps)).to eq []
      end
    end

    context 'find success but no page' do
      let(:search) {}
      let(:page) { 9_876_543 }
      it 'have not size page' do
        subject
        expect(assigns(:ps)).to eq []
      end
    end

    context 'find success' do
      let(:search) { product1.name }
      let(:page) {}
      it do
        subject
        expect(assigns(:ps)).to eq [product1]
      end
    end
  end
end
