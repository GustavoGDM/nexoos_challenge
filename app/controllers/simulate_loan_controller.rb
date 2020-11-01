class SimulateLoanController < ApplicationController
  def index
    @loan = Loan.new
  end
end
