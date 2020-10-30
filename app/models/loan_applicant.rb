class LoanApplicant < ApplicationRecord
  validates :company_name, :cnpj, :phones, presence: true
end
