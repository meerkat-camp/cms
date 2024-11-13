FactoryBot.define do
  factory :post do
    sequence(:slug) { |n| "/#{Faker::Internet.slug(glue: '-')}-#{n}" }
    title { Faker::Lorem.sentence }
    content { nil }
    site
  end
end
