class LoanApplicantsController < AuthenticatedController
  def new
    @loan = Loan.new(loan_params)
    @loan_applicant = LoanApplicant.new(loan: @loan)
    unless @loan.amount && @loan.installments
      redirect_to new_loan_path
    end
  end

  def create
    if params[:loan_applicant][:loan_attributes].present? && params[:loan_applicant][:loan_attributes][:id].present?
      @loan_applicant = LoanApplicant.new(company_name: params[:loan_applicant][:company_name],cnpj: params[:loan_applicant][:cnpj],phones: params[:loan_applicant][:phones])
      loan = Loan.find(params[:loan_applicant][:loan_attributes][:id])
      @loan_applicant.loan = loan
    else
      @loan_applicant = LoanApplicant.new(loan_applicant_params)
    end
    @loan_applicant.phones = @loan_applicant.phones.reject{|p| p.empty? }
    respond_to do |format|
      if @loan_applicant.save
        if params[:new_loan_applicant] == 'true'
          @loan_applicant = LoanApplicant.new(loan: @loan_applicant.loan)
          format.html { render :new, locals: {loan_applicant: @loan_applicant, loan: @loan_applicant.loan} }
        else   
          format.html { redirect_to painel_index_path, notice: "created." }
        end
      else
        @loan_applicant = LoanApplicant.new(loan: @loan_applicant.loan)
        format.html { render :new, locals: {loan_applicant: @loan_applicant, loan: @loan_applicant.loan} }
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
    params.permit(:amount,:installments)
  end
end
