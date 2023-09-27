module Blocks
  module Renderer
    module Html
      class Paragraph < Base
        def to_html
          scrubbed_tag(:p, @block.text)
        end
      end
    end
  end
end
