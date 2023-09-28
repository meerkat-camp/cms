FactoryBot.define do
  factory :site do
    domain { Faker::Internet.domain_name }
    title { Faker::Company.name }
    language_code { 'en' }
  end
end
