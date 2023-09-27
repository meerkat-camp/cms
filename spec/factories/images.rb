FactoryBot.define do
  factory :image do
    site
    file { Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/10x10.jpg"), 'image/jpeg') }
  end
end
