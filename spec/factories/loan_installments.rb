FactoryBot.define do
  factory :loan_installment do
    value { "9.99" }
    installment_number { 3 }
    due_date { Time.zone.now }
    loan 
    loan_applicant
  end
end
