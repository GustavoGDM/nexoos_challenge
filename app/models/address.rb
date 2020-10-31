class Address < ApplicationRecord
  belongs_to :loan_applicant
  validates :zip_code, :state, :city, :street, :number, :loan_applicant, presence: true
  
end
