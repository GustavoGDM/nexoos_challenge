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
  
  it 'Is invalid without date_acquisition' do
    loan = build(:loan, date_acquisition: nil)
    loan.valid?
    expect(loan.errors[:date_acquisition]).to include("can't be blank")
  end

  it 'Is invalid without accept_terms' do
    loan = build(:loan, accept_terms: nil)
    loan.valid?
    expect(loan.errors[:accept_terms]).to include("can't be blank")
  end

  it 'Is invalid without loan_applicant' do
    loan = build(:loan, loan_applicant: nil)
    loan.valid?
    expect(loan.errors[:loan_applicant]).to include("can't be blank")
  end

  it 'Is invalid with accept_terms false' do
    loan = build(:loan, accept_terms: false)
    loan.valid?
    expect(loan.errors[:accept_terms]).to include("must be accepted")
  end
end
