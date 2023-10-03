module Form
  class TextFieldComponent < BaseInputComponent
    def input_classes
      classes = ['input']
      classes << 'is-danger' if errors.any?
      classes.join(' ')
    end
  end
end
