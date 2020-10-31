class LoanApplicant < ApplicationRecord
  validates :company_name, :cnpj, :phones, presence: true
  has_many :loans
  accepts_nested_attributes_for :loans
end
