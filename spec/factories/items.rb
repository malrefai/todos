FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    done { Faker::Boolean.boolean }

    association :todo, factory: :todo
  end
end
