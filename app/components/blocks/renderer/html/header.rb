module Blocks
  module Renderer
    module Html
      class Header < Base
        erb_template '<h<%= @block.level %>><%= raw(text) %></h<%= @block.level %>>'

        def text
          scrub_html(@block.text)
        end
      end
    end
  end
end
