module Blocks
  class Header < Base
    keyword :type, default: 'header'

    keyword :level
    keyword :text

    ALLOWED_LEVELS = [2, 3, 4].freeze

    def self.from_editor_js(hash)
      new(id: hash['id'], level: hash['data']['level'], text: hash['data']['text'])
    end

    def to_editor_js
      {
        'id' => id, 'type' => type,
        'data' => { 'level' => level, 'text' => text }
      }
    end

    def level
      return 2 unless ALLOWED_LEVELS.include?(super)

      super
    end
  end
end
