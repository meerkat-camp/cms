FactoryBot.define do
  factory :site do
    internal_subdomain { Faker::Internet.domain_word }
    domain { Faker::Internet.domain_name }
    title { Faker::Company.name }
    language_code { 'en' }
  end
end
