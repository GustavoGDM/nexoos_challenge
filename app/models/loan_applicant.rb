class LoanApplicant < ApplicationRecord
  has_many :loans
  has_many :addresses
  accepts_nested_attributes_for :loans
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  
  validates :company_name, :cnpj, :phones, presence: true
end
