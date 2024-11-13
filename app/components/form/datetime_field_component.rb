module Form
  class DatetimeFieldComponent < BaseInputComponent
    def value
      datetime = form.object.send(attribute) || placeholder

      return unless datetime

      l(datetime.localtime, format: :html_datetime)
    end
  end
end
