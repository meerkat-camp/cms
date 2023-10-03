module Blocks
  class Image < Base
    def type
      'image'
    end

    def image_url
      "/sites/#{image.site.public_id}/images/#{image.public_id}"
    end

    def image
      return @image if defined?(@image)

      @image = ::Image.find(image_id)
    end

    private

    def image_id
      @data['file']['url'].match(%r{/images/([0-9a-zA-Z\-]{12,36})})[1]
    end
  end
end
