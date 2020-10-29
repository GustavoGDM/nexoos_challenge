class LoanController < AuthenticatedController
  def new
    @loan = Loan.new
  end
end
