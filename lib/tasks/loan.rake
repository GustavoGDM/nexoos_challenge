namespace :loan do
  desc "Generate credit installments"
  task generate_installments: :environment do
    puts "Generate credit installments"
    loans = Loan.all
    loans.each do |l|
      loan_installment = l.loan_installments.last
      if loan_installment.installment_number < l.installments
        due_date = (loan_installment.due_date).strftime('%d/%m')
        today = Time.zone.now.strftime('%d/%m')
        if due_date == today 
          l.loan_applicants.each do |la|
            LoanInstallment.create(value: loan_installment.value, due_date: (loan_installment.due_date + 1.month), installment_number: (loan_installment.installment_number + 1), loan:l ,loan_applicant: la)
          end
        end
      end
    end
  end
end