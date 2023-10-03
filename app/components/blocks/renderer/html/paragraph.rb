module Blocks
  module Renderer
    module Html
      class Paragraph < Base
        erb_template  '<p><%= raw(text) %></p>'

        def text
          scrub_html(@block.text)
        end
      end
    end
  end
end
