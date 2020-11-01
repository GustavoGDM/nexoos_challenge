FactoryBot.define do
  factory :loan_applicant do
    company_name { Faker::Company.name }
    cnpj { Faker::Company.brazilian_company_number }
    phones { [ Faker::PhoneNumber.phone_number] }
    loan
  end
end
