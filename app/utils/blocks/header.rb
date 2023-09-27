module Blocks
  class Header < Base
    ALLOWED_LEVELS = [2, 3, 4].freeze

    def initialize(id:, data:)
      super
      @data['level'] = 2 unless ALLOWED_LEVELS.include?(@data['level'])
    end

    def type
      'header'
    end
  end
end
