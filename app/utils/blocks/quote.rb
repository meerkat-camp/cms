module Blocks
  class Quote < Base
    keyword :type, default: 'quote'
    keyword :text
    keyword :caption

    def self.from_editor_js(hash)
      new(id: hash['id'], text: hash['data']['text'], caption: hash['data']['caption'])
    end

    def to_editor_js
      {
        'id' => id, 'type' => type,
        'data' => { 'text' => text, 'caption' => caption, 'alignment' => 'left' }
      }
    end
  end
end
