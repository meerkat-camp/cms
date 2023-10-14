module Blocks
  class Code < Base
    keyword :code

    def self.from_editor_js(hash)
      new(id: hash['id'], code: hash['data']['code'])
    end

    def editor_js_data
      { 'code' => code }
    end
  end
end
