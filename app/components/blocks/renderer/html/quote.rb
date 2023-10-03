module Blocks
  module Renderer
    module Html
      class Quote < Base
        delegate :text, :caption, to: :block
        erb_template '<blockquote><p><%= raw(quote) %></p><%= raw(cite) %></blockquote>'

        private

        def quote
          scrub_html(text)
        end

        def cite
          scrubbed_tag(:cite, caption) if caption.present?
        end
      end
    end
  end
end
