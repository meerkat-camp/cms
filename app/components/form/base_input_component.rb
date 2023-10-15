module Form
  class BaseInputComponent < ViewComponent::Base
    attr_reader :form, :attribute, :data, :placeholder

    def initialize(form:, attribute:, placeholder: nil, data: {})
      @form = form
      @attribute = attribute
      @placeholder = placeholder
      @data = data
    end

    protected

    def errors
      form.object.errors[attribute]
    end

    def help_text
      return unless errors.any?

      messages = errors.join(', ')
      helpers.tag.p(messages, class: 'help is-danger')
    end

    def input_classes
      classes = ['input']
      classes << 'is-danger' if errors.any?
      classes.join(' ')
    end
  end
end
