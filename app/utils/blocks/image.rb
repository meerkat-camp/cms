module Blocks
  class Image < Base
    def type
      'image'
    end

    def image_url
      "/sites/#{image.site.id}/images/#{image.id}"
    end

    def image
      return @image if defined?(@image)

      @image = ::Image.find(image_id)
    end

    private

    def image_id
      @data['file']['url'].match(%r{/images/([0-9a-f\-]{36})})[1]
    end
  end
end
