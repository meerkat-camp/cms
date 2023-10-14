module Blocks
  class Paragraph < Base
    keyword :text

    def self.from_editor_js(hash)
      new(id: hash['id'], text: hash['data']['text'])
    end

    def editor_js_data
      { 'text' => text }
    end
  end
end
