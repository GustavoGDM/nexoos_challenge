FactoryBot.define do
  factory :address do
    zip_code { Faker::Address.zip_code }
    state { Faker::Address.state }
    city { Faker::Address.city  }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    loan_applicant
  end
end
