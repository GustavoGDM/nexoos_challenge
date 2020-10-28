class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.float :amount
      t.integer :installments
      t.float :monthly_rate
      t.datetime :date_acquisition

      t.timestamps
    end
  end
end
