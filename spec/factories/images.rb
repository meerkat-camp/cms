FactoryBot.define do
  factory :image do
    site
    file { Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/15x15.jpg"), 'image/jpeg') }
  end
end
