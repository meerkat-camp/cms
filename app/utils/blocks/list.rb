module Blocks
  class List < Base
    keyword :type, default: 'list'

    STYLE_MAPPING = {
      'unordered' => :ul,
      'ordered' => :ol
    }.freeze

    keyword :style
    keyword :items

    def self.from_editor_js(hash)
      new(
        id: hash['id'],
        style: STYLE_MAPPING[hash['data']['style']],
        items: hash['data']['items']
      )
    end

    def to_editor_js
      {
        'id' => id, 'type' => type,
        'data' => {
          'style' => STYLE_MAPPING.key(style),
          'items' => items
        }
      }
    end
  end
end
