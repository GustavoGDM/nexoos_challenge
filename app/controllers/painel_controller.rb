class PainelController < AuthenticatedController
  def index
    @loans = Loan.last(5)
  end
end
