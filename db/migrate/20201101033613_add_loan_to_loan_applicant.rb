class AddLoanToLoanApplicant < ActiveRecord::Migration[6.0]
  def change
    add_reference :loan_applicants, :loan, null: false, foreign_key: true
  end
end
