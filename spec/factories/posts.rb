FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { nil }
    site
  end
end
