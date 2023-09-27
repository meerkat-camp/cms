module Blocks
  class Base
    def initialize(id:, data:)
      @id = id
      @data = data
    end

    def type
      raise NotImplementedError
    end

    def method_missing(method_name)
      @data[method_name.to_s.underscore]
    end

    def respond_to_missing?(method_name, include_private = false)
      @data.key?(method_name.to_s) || super
    end
  end
end
