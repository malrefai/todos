FactoryBot.define do
  factory :todo do
    title { Faker::Simpsons.quote }
    created_by { Faker::Name.name }
  end
end
