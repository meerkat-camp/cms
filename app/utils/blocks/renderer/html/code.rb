module Blocks
  module Renderer
    module Html
      class Code < Base
        def to_html
          tag(:pre, h(@block.code))
        end
      end
    end
  end
end
