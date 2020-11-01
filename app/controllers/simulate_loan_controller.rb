class SimulateLoanController < AuthenticatedController
  def index
    @loan = Loan.new
  end
end
