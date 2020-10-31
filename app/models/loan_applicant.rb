class LoanApplicant < ApplicationRecord
  has_many :loans
  has_many :addresses
  accepts_nested_attributes_for :loans, :addresses
  validates :company_name, :cnpj, :phones, presence: true
  
end
