require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :phone }
  end

  describe 'associations' do
    it { is_expected.to have_many :orders }
  end

  describe 'db schema' do
    context 'columns' do
      it { is_expected.to have_db_column(:name).of_type :string }
      it { is_expected.to have_db_column(:phone).of_type :string }
      it { is_expected.to have_db_column(:address).of_type :string }
      it { is_expected.to have_db_column(:image).of_type :string }
      it { is_expected.to have_db_column(:email).of_type :string }
    end
  end
end
