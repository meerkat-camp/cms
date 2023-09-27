require 'json'

module Blocks
  module Renderer
    module Html
      def self.render(blocks)
        rendered_blocks = blocks.map do |block|
          renderer_class = "Blocks::Renderer::Html::#{block.type.classify}".constantize
          renderer_class.new(block).to_html
        end

        # rubocop:disable Rails/OutputSafety
        # In this instance we really do return HTML
        rendered_blocks.join.html_safe
        # rubocop:enable Rails/OutputSafety
      end
    end
  end
end
