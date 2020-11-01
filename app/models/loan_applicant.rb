class LoanApplicant < ApplicationRecord
  belongs_to :loan
  has_many :addresses
  accepts_nested_attributes_for :loan
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  validates :loan, presence: true
  validates :company_name, :cnpj, :phones, presence: true
end
