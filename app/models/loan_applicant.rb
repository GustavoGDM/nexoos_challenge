class LoanApplicant < ApplicationRecord
  validates :company_name, :cnpj, presence: true
  has_many :loans
end
