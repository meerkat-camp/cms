module Form
  class BaseInputComponent < ViewComponent::Base
    attr_reader :form, :attribute, :placeholder

    def initialize(form:, attribute:, placeholder: nil)
      @form = form
      @attribute = attribute
      @placeholder = placeholder
    end

    protected

    def errors
      form.object.errors[attribute]
    end
  end
end
