require 'rails_helper'

describe Editable do
  describe 'assign images after create' do
    it 'assigns images' do
      imageable = build(:post)
      image = create(:image, imageable: nil)

      imageable.content = {
        "blocks" =>
        [{
          "id" => "3VXVq1RLaU",
          "type" => "image",
          "data" => {
            "file" => {
              "url" => "https://example.com/images/#{image.id}"
            }
          }
        }]
      }.to_json

      imageable.save

      expect(imageable.images.to_a).to eq([image])
    end
  end
end
