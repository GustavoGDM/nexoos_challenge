require 'rails_helper'

RSpec.describe LoanApplicant, type: :model do
  it 'Is valid with company_name, cnpj, phones, adress' do
    loan_applicant = create(:loan_applicant)
    expect(loan_applicant).to be_valid
  end

  it 'Is invalid without company_name' do
    loan_applicant = build(:loan_applicant, company_name: nil)
    loan_applicant.valid?
    expect(loan_applicant.errors[:company_name]).to include("can't be blank")
  end

  it 'Is invalid without cnpj' do
    loan_applicant = build(:loan_applicant, cnpj: nil)
    loan_applicant.valid?
    expect(loan_applicant.errors[:cnpj]).to include("can't be blank")
  end

  it 'Is invalid without phones' do
    loan_applicant = build(:loan_applicant, phones: nil)
    loan_applicant.valid?
    expect(loan_applicant.errors[:phones]).to include("can't be blank")
  end

  it "Has many loans" do
    association = LoanApplicant.reflect_on_association(:loans).macro
    expect(association).to eq(:has_many)
  end

  it "Has many addresses" do
    association = LoanApplicant.reflect_on_association(:addresses).macro
    expect(association).to eq(:has_many)
  end
end
