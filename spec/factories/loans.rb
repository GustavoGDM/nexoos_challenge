FactoryBot.define do
  factory :loan do
    amount {rand(1.00..9999.99) }
    installments { rand(1..60) }
    monthly_rate { rand(1..12) }
    date_acquisition { Faker::Time.between(from: Time.zone.now - 1.year, to: Time.zone.now)  }
    accept_terms { true }
    loan_applicant
  end
end
