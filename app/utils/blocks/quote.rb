module Blocks
  class Quote < Base
    keyword :text
    keyword :caption

    def self.from_editor_js(hash)
      new(id: hash['id'], text: hash['data']['text'], caption: hash['data']['caption'])
    end

    def editor_js_data
      { 'text' => text, 'caption' => caption, 'alignment' => 'left' }
    end
  end
end
