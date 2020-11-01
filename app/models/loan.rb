class Loan < ApplicationRecord
  has_many :loan_applicants
  has_many :loan_installments
  validates :amount, :installments, :monthly_rate, numericality: {greater_than: 0}, presence: true
  validates :date_acquisition, presence: true
  before_validation :set_date_acquisition
  after_initialize :set_default
  
  private
  def set_default
    self.monthly_rate = 0.015
  end
  def set_date_acquisition
    self.date_acquisition = Time.zone.now
  end
  
end
