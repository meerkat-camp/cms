require 'spec_helper'

describe Hugo::ImageFile do
  describe '#write' do
    it 'writes the image to the correct path' do
      image = create(:image)

      image_file = described_class.new(image)

      image_file.write

      file_path = Rails.root.join('tmp', 'hugo', image.site.id.to_s, 'static', 'images', image.id)
      expect(File.binread(file_path)).to eq(image.file.download)
    end
  end
end
