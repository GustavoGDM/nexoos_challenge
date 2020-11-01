require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'Is valid with zip_code, state, city, street' do
    address = create(:address)
    expect(address).to be_valid
  end
  
  it 'Is invalid without zip_code' do
    address = build(:address, zip_code: nil)
    address.valid?
    expect(address.errors[:zip_code]).to include("can't be blank")
  end
  
  it 'Is invalid without state' do
    address = build(:address, state: nil)
    address.valid?
    expect(address.errors[:state]).to include("can't be blank")
  end
  
  it 'Is invalid without city' do
    address = build(:address, city: nil)
    address.valid?
    expect(address.errors[:city]).to include("can't be blank")
  end

  it 'Is invalid without street' do
    address = build(:address, street: nil)
    address.valid?
    expect(address.errors[:street]).to include("can't be blank")
  end

  it 'Is invalid without loan_applicant' do
    address = build(:address, loan_applicant: nil)
    address.valid?
    expect(address.errors[:loan_applicant]).to include("can't be blank")
  end
end
