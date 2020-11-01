class LoanApplicant < ApplicationRecord
  belongs_to :loan
  has_many :addresses
  accepts_nested_attributes_for :loan
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  validates :company_name, :cnpj, :phones, :loan, :addresses, presence: true
  has_many :loan_installments
end
