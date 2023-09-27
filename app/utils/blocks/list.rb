module Blocks
  class List < Base
    STYLE_MAPPING = {
      'unordered' => :ul,
      'ordered' => :ol
    }.freeze

    def type
      'list'
    end

    def html_type
      STYLE_MAPPING[@data['style']]
    end
  end
end
