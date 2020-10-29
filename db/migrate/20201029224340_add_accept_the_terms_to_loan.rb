class AddAcceptTheTermsToLoan < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :accept_terms, :bool
  end
end
