module Blocks
  module Renderer
    module Html
      class Quote < Base
        delegate :text, :caption, to: :@block

        def to_html
          quote = scrubbed_tag(:p, text)
          tag(:blockquote, "#{quote}#{cited_caption}")
        end

        private

        def cited_caption
          scrubbed_tag(:cite, caption) if caption.present?
        end
      end
    end
  end
end
