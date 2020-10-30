class AddLoanApplicantIdToLoan < ActiveRecord::Migration[6.0]
  def change
    add_reference :loans, :loan_applicant, null: false, foreign_key: true
  end
end
