require 'rails_helper'

RSpec.describe Loan, type: :model do
  it 'Is valid with amount, installments, monthly_rate, date_acquisition, accept_terms, loan_applicant' do
    loan = create(:loan)
    expect(loan).to be_valid
  end

  it 'Is invalid without amount' do
    loan = build(:loan, amount: nil)
    loan.valid?
    expect(loan.errors[:amount]).to include("can't be blank")
  end
  
  it 'Is invalid without installments' do
    loan = build(:loan, installments: nil)
    loan.valid?
    expect(loan.errors[:installments]).to include("can't be blank")
  end
  
  it 'is valid because it generated date_acquisition' do
    loan = build(:loan, date_acquisition: nil)
    loan.valid?
    expect(loan.errors[:date_acquisition]).not_to eql(nil)
  end

  it 'Is invalid without accept_terms' do
    loan = build(:loan, accept_terms: nil)
    loan.valid?
    expect(loan.errors[:accept_terms]).to include("can't be blank")
  end

  it 'Is invalid with accept_terms false' do
    loan = build(:loan, accept_terms: false)
    loan.valid?
    expect(loan.errors[:accept_terms]).to include("must be accepted")
  end

  it "Has many loans" do
    association = Loan.reflect_on_association(:loan_applicants).macro
    expect(association).to eq(:has_many)
  end
end
