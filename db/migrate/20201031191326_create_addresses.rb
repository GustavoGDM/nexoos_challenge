class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code
      t.string :state
      t.string :city
      t.string :street
      t.string :number

      t.timestamps
    end
  end
end
