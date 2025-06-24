FactoryBot.define do
  factory :schedule do
    equipment { nil }
    status { "MyString" }
    period_start { "2025-06-24" }
    period_end { "2025-06-24" }
  end
end
