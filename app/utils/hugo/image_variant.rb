module Hugo
  class ImageVariant
    attr_reader :image, :variant

    def initialize(image, variant)
      @image = image
      @variant = variant
    end

    def build_path
      "static#{public_path}"
    end

    def public_path
      "/images/#{image.public_id}/#{file_name}.#{file_extenstion}"
    end

    def binary_image
      File.binread(image.fs_path(variant:))
    end

    private

    def file_extenstion
      String(variant).split('_').last
    end

    def file_name
      String(variant).split('_').first(2).join('_')
    end
  end
end
