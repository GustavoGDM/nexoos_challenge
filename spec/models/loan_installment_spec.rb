require 'rails_helper'

RSpec.describe LoanInstallment, type: :model do
  it 'Is valid with value, installment_number, loan, loan_applicant' do
    loan_installment = create(:loan_applicant)
    expect(loan_installment).to be_valid
  end

  it 'Is invalid without value' do
    loan_installment = build(:loan_installment, value: nil)
    loan_installment.valid?
    expect(loan_installment.errors[:value]).to include("can't be blank")
  end

  it 'Is invalid without installment_number' do
    loan_installment = build(:loan_installment, installment_number: nil)
    loan_installment.valid?
    expect(loan_installment.errors[:installment_number]).to include("can't be blank")
  end

  it 'Is invalid without due_date' do
    loan_installment = build(:loan_installment, due_date: nil)
    loan_installment.valid?
    expect(loan_installment.errors[:due_date]).to include("can't be blank")
  end

  it 'Is invalid without loan' do
    loan_installment = build(:loan_installment, loan: nil)
    loan_installment.valid?
    expect(loan_installment.errors[:loan]).to include("can't be blank")
  end

  it 'Is invalid without loan_applicant' do
    loan_installment = build(:loan_installment, loan_applicant: nil)
    loan_installment.valid?
    expect(loan_installment.errors[:loan_applicant]).to include("can't be blank")
  end
end
