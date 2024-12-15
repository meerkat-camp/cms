FactoryBot.define do
  factory :theme do
    name { Faker::Lorem.sentences(number: 1) }
    description { Faker::Lorem.sentences(number: 3).join(' ') }
    hugo_theme { %w[simple_emoji ink].sample }

    trait :simple_emoji do
      name { 'Simple Emoji' }
      description { 'A playfull simple theme that supports emoji.' }
      hugo_theme { 'simple_emoji' }
    end
  end
end
