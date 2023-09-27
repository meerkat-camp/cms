module Blocks
  class Table < Base
    def thead?
      @data['withHeadings']
    end

    def content
      @data['content']
    end

    def type
      'table'
    end
  end
end
