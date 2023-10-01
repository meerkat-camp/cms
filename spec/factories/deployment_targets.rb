FactoryBot.define do
  factory :deployment_target do
    public_hostname { Faker::Internet.domain_name }
    site
    type { %i[production staging].sample }
    provider { Rclone::PROVIDERS.keys.sample.to_s }

    trait :internal do
      provider { 'internal' }
    end

    trait :fastmail do
      type { :production }
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
