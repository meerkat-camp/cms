module Form
  class SelectComponent < BaseInputComponent
    attr_reader :options

    def initialize(form:, attribute:, options:)
      super(form:, attribute:)
      @options = options
    end

    def input_classes
      classes = ['input']
      classes << 'is-danger' if errors.any?
      classes.join(' ')
    end
  end
end
