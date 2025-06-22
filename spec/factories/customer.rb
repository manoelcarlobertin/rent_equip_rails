FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    dob  { Faker::Date.birthday(min_age: 18, max_age: 90) }
    email { Faker::Internet.unique.email }
    mobile_phone {
      # Gera um número brasileiro no formato (11) 9XXXX-XXXX
      ddd = Faker::Number.between(from: 11, to: 99)
      suffix = Faker::Number.number(digits: 4)
      prefix = Faker::Number.number(digits: 5)
      "(#{ddd}) #{prefix}-#{suffix}"
    }
    # address { Faker::Address.street_address }
    # city { Faker::Address.city }
    # state { Faker::Address.state }
    # zip_code { Faker::Address.zip_code }
  end
end
