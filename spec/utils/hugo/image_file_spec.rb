require 'spec_helper'

describe Hugo::ImageFile do
  describe '#write' do
    it 'writes the image to the correct path' do
      image = create(:image)
      deployment_target = create(:deployment_target, :staging)
      variant_key = Image::Variants.keys.first

      image_variant = Hugo::ImageVariant.new(image, variant_key)
      image_file = described_class.new(image_variant, deployment_target)

      image_file.write

      file_path = Rails.root.join(deployment_target.build_path, image_variant.build_path)
      expect(File.binread(file_path)).to eq(File.binread(image.fs_path(variant: variant_key)))
    end
  end
end
