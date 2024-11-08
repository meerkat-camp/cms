module Blocks
  module Renderer
    module Html
      class Code < Base
        erb_template '<pre><code><%= block.code %></code></pre>'
      end
    end
  end
end
