class LoanInstallment < ApplicationRecord
  belongs_to :loan
  belongs_to :loan_applicant
  validates :value,:installment_number,:due_date, :loan, :loan_applicant, presence: true
end
