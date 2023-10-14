module Blocks
  class Header < Base
    keyword :level
    keyword :text

    ALLOWED_LEVELS = [2, 3, 4].freeze

    def self.from_editor_js(hash)
      new(id: hash['id'], level: hash['data']['level'], text: hash['data']['text'])
    end

    def editor_js_data
      { 'level' => level, 'text' => text }
    end

    def level
      return 2 unless ALLOWED_LEVELS.include?(super)

      super
    end
  end
end
