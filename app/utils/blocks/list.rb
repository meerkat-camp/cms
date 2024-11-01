module Blocks
  class List < Base
    STYLE_MAPPING = {
      'unordered' => 'ul',
      'ordered' => 'ol'
    }.freeze

    keyword :style, default: 'ul'
    keyword :items

    def self.from_editor_js(hash)
      new(
        id: hash['id'],
        style: STYLE_MAPPING[hash['data']['style']] || 'ul',
        items: hash['data']['items']
      )
    end

    def editor_js_data
      { 'style' => STYLE_MAPPING.key(style), 'items' => items }
    end
  end
end
