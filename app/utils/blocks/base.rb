module Blocks
  class Base
    extend ::Portrayal

    keyword :id
    keyword :type, default: proc { Blocks::MAPPING.key(self.class) }

    def to_editor_js
      { 'id' => id, 'type' => type, 'data' => editor_js_data }
    end
  end
end
