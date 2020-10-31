class LoansController < AuthenticatedController
  def new
    @loan = Loan.new
  end
end
