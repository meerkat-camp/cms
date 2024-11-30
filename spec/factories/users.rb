FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }

    trait :superadmin do
      super_admin { true }
    end

    trait :site_admin do
      sites { [create(:site)] }
    end
  end
end
