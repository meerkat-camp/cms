module Form
  class TextFieldComponent < ViewComponent::Base
    attr_reader :form, :attribute

    def initialize(form:, attribute:)
      @form = form
      @attribute = attribute
    end

    def input_classes
      classes = ['input']
      classes << 'is-danger' if errors.any?
      classes.join(' ')
    end

    def help_text
      return unless errors.any?

      messages = errors.join(', ')
      helpers.tag.p(messages, class: 'help is-danger')
    end

    private

    def errors
      form.object.errors[attribute]
    end
  end
end
