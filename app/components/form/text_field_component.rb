module Form
  class TextFieldComponent < BaseInputComponent
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
  end
end
