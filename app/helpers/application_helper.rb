module ApplicationHelper
  def loan_calculation loan
    prev = ((1.0 + loan.monthly_rate) ** loan.installments)
    result = loan.amount * (( prev * loan.monthly_rate)/( prev - 1))
    number_with_precision(result, precision: 3)
  end
end
