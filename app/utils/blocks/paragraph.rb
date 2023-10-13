module Blocks
  class Paragraph < Base
    keyword :type, default: 'paragraph'
    keyword :text

    def self.from_editor_js(hash)
      new(id: hash['id'], text: hash['data']['text'])
    end

    def to_editor_js
      {
        'id' => id,
        'type' => type,
        'data' => {
          'text' => text
        }
      }
    end
  end
end
