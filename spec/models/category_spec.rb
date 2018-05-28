require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end

  describe 'associations' do
    it { is_expected.to have_many :products }
  end

  describe 'db schema' do
    context 'columns' do
      it { is_expected.to have_db_column(:name).of_type :string }
    end
  end
end
