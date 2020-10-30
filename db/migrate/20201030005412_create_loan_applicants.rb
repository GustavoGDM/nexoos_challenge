class CreateLoanApplicants < ActiveRecord::Migration[6.0]
  def change
    create_table :loan_applicants do |t|
      t.string :company_name
      t.string :cnpj
      t.string :phones, array: true

      t.timestamps
    end
  end
end
