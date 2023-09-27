module Blocks
  module Renderer
    module Html
      class Image < Base
        delegate :caption, :image, :image_url, to: :@block

        def to_html
          tag(:figure, image_tag + figcaption)
        end

        private

        def image_tag
          %(<img
              src="#{image_url}"
              loading="lazy"
              height="#{image.height}"
              width="#{image.width}"
              alt="#{caption}"
            />).split("\n").map(&:strip).join(' ')
        end

        def figcaption
          return '' if caption.blank?

          scrubbed_tag(:figcaption, caption)
        end
      end
    end
  end
end
