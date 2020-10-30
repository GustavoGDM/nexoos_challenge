FactoryBot.define do
  factory :loan_applicant do
    company_name { "MyString" }
    cnpj { "MyString" }
    phones { ['21999999999'] }
  end
end
