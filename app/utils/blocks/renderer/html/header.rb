module Blocks
  module Renderer
    module Html
      class Header < Base
        def to_html
          scrubbed_tag("h#{@block.level}", @block.text)
        end
      end
    end
  end
end
