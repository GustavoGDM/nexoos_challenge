class LoanApplicantsController < AuthenticatedController
  def new
    @loan = Loan.new(loan_params)
    @loan_applicant = LoanApplicant.new()
    unless @loan.amount && @loan.installments && @loan.accept_terms
      redirect_to new_loan_path
    end
  end

  def create
    @loan_applicant = LoanApplicant.new(loan_applicant_params)
    respond_to do |format|
      if @loan_applicant.save
        format.html { redirect_to painel_index_path, notice: 'Loan was successfully created.' }
      else
        format.html { redirect_to painel_index_path }
      end
    end
  end
  
  private 
  def loan_applicant_params
    params.require(:loan_applicant).permit(
      :company_name,
      :cnpj,
      phones: []
    )
  end

  def loan_params
    params.permit(:amount,:installments,:accept_terms)
  end
end
