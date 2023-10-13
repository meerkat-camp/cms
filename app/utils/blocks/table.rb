module Blocks
  class Table < Base
    keyword :type, default: 'table'

    keyword :content
    keyword :with_headings

    def self.from_editor_js(hash)
      new(
        id: hash['id'],
        with_headings: hash['data']['withHeadings'],
        content: hash['data']['content']
      )
    end

    def to_editor_js
      {
        'id' => id, 'type' => type,
        'data' => { 'withHeadings' => with_headings, 'content' => content }
      }
    end
  end
end
