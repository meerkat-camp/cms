FactoryBot.define do
  factory :page do
    title { Faker::Lorem.sentence }
    content { nil }
    site
    slug { Faker::Lorem.sentence.parameterize }
  end
end
