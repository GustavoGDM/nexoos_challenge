class Loan < ApplicationRecord
  validates :amount, :installments, :monthly_rate, :date_acquisition, numericality: { greater_than: 0} , presence: true
  after_initialize :set_default
  
  private
  
  def set_default
    self.monthly_rate = 0.015
  end
end
