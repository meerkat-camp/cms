FactoryBot.define do
  factory :site do
    sequence(:domain) { |n| Faker::Internet.domain_name + n.to_s }
    title { Faker::Company.name }
    theme
    language_code { 'en' }
  end
end
