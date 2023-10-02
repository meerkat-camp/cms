require 'spec_helper'

describe Hugo::ImageFile do
  describe '#write' do
    it 'writes the image to the correct path' do
      image = create(:image)
      deployment_target = create(:deployment_target, :staging)

      image_file = described_class.new(image, deployment_target)

      image_file.write

      file_path = Rails.root.join(deployment_target.build_path, 'static', 'images', image.id)
      expect(File.binread(file_path)).to eq(File.binread(image.fs_path))
    end
  end
end
