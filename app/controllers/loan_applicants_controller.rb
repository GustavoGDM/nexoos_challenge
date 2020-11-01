class LoanApplicantsController < AuthenticatedController
  def new
    @loan = Loan.new(loan_params)
    @loan_applicant = LoanApplicant.new(loan: @loan)
    unless @loan.amount && @loan.installments && @loan.accept_terms
      redirect_to new_loan_path
    end
  end

  def create
    @loan_applicant = LoanApplicant.new(loan_applicant_params)
    @loan_applicant.phones = @loan_applicant.phones.reject{|p| p.empty? }
    respond_to do |format|
      if @loan_applicant.save
        format.html { redirect_to painel_index_path, notice: 'Loan was successfully created.' }
      else
        @loan_applicant = LoanApplicant.new(loan: @loan_applicant.loan)
        format.html { render :new, locals: {loan_applicant:@loan_applicant, loan: @loan_applicant.loan} }
      end
    end
  end
  
  private 
  def loan_applicant_params
    params.require(:loan_applicant).permit(
      :company_name,
      :cnpj,
      phones: [],
      loan_attributes:[
        :id,
        :amount,
        :installments,
        :accept_terms
      ],
      addresses_attributes:[
        :zip_code,
        :state,
        :city,
        :street,
        :number,
        :_destroy
      ]
    )
  end

  def loan_params
    params.permit(:amount,:installments,:accept_terms)
  end
end
