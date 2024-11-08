module Blocks
  class Code < Base
    keyword :code
    keyword :language, default: 'plaintext'

    def self.from_editor_js(hash)
      new(id: hash['id'], code: hash['data']['code'], language: hash['data']['language'])
    end

    def editor_js_data
      { 'code' => code, 'language' => language }
    end
  end
end
