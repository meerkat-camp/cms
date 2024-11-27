FactoryBot.define do
  factory :social_media_link do
    site
    url { Faker::Internet.url }
    name { Faker::Lorem.word }
    icon { SocialMediaService.all.sample.icon }
  end
end
