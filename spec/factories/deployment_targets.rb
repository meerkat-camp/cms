FactoryBot.define do
  factory :deployment_target do
    public_hostname { Faker::Internet.domain_name }
    site

    trait :fastmail do
      type { 'fastmail' }
      provider { 'fastmail' }

      config do
        {
          'email' => Faker::Internet.email,
          'password' => Faker::Internet.password,
          'path' => Faker::File.file_name
        }
      end
    end
  end
end
