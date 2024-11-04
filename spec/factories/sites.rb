FactoryBot.define do
  factory :site do
    domain { Faker::Internet.domain_name }
    title { Faker::Company.name }
    theme
    language_code { 'en' }
  end
end
