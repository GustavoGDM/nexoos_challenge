class LoansController < AuthenticatedController
  before_action :set_loan, only: [:show]
  
  def index
    @loans = Loan.all
  end
  
  def new
    @loan = Loan.new
  end
  
  def show
  end

  private
  def set_loan
    @loan = Loan.find(params[:id])
  end
end
