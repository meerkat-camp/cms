module Form
  class LanguageSelectComponent < BaseInputComponent
    def select_options
      options_for_select(Codes.all_translated)
    end
  end
end
