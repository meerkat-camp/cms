FactoryBot.define do
  factory :site do
    internal_subdomain do
       [
        Faker::Internet.domain_word,
        Faker::Internet.domain_word,
        Faker::Internet.domain_word
      ].join('-')
    end
    domain { Faker::Internet.domain_name }
    title { Faker::Company.name }
    language_code { 'en' }
  end
end
