FactoryBot.define do
  factory :todo do
    title { Faker::Simpsons.quote }
    created_by { Faker::Number.number(10) }
  end
end
