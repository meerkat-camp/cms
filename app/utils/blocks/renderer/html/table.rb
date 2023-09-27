module Blocks
  module Renderer
    module Html
      class Table < Base
        delegate :thead?, :content, to: :@block

        def to_html
          tag(:table, thead + tbody)
        end

        private

        def thead
          return '' unless thead?

          tag(:thead, row(content.first))
        end

        def tbody
          rows_data = content.drop(thead? ? 1 : 0)

          content = rows_data.map { |data| row(data) }.join
          tag(:tbody, content)
        end

        def row(row_data)
          content = row_data.map { |cell| scrubbed_tag(:td, cell) }.join
          tag(:tr, content)
        end
      end
    end
  end
end
