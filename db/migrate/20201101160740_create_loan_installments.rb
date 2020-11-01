class CreateLoanInstallments < ActiveRecord::Migration[6.0]
  def change
    create_table :loan_installments do |t|
      t.float :value
      t.integer :installment_number
      t.datetime :due_date
      t.references :loan, null: false, foreign_key: true
      t.references :loan_applicant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
