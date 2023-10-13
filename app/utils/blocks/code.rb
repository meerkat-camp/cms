module Blocks
  class Code < Base
    keyword :type, default: 'code'

    keyword :code

    def self.from_editor_js(hash)
      new(id: hash['id'], code: hash['data']['code'])
    end

    def to_editor_js
      {
        'id' => id, 'type' => type,
        'data' => { 'code' => code }
      }
    end
  end
end
