module Blocks
  module Renderer
    module HugoHtml
      class Code < Html::Code
        erb_template '{{< highlight <%= block.language %> >}}<%= block.code %>{{< / highlight >}}'
      end
    end
  end
end
