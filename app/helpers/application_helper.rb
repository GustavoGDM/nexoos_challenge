module ApplicationHelper
  def loan_calculation loan
    prev = ((1.0 + loan.monthly_rate) ** loan.installments)
    result = loan.amount * (( prev * loan.monthly_rate)/( prev - 1))
    number_with_precision(result, precision: 3)
  end
  def loan_calculation_per_applicant(loan)
    result = loan_calculation(loan).to_f / loan.loan_applicants.count
    number_with_precision(result, precision: 3)
  end
  def formated_loan_amount(loan)
    number_with_precision(loan.amount, precision: 3)
  end
end
