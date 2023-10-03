module Blocks
  module Renderer
    module Html
      class Code < Base
        erb_template '<pre><%= block.code %></pre>'
      end
    end
  end
end
