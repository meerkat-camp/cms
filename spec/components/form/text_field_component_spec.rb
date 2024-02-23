describe Form::TextFieldComponent, type: :component do
  let(:form) do
    instance_spy(
      ActionView::Helpers::FormBuilder,
      object: instance_double(ApplicationRecord, errors:)
    )
  end

  context 'without error' do
    let(:errors) { { name: [] } }

    it 'renders a normal text field' do
      render_inline(described_class.new(form:, attribute: :name))

      expect(page).to have_css('.field')
      expect(page).to have_no_css('p.help')
    end
  end

  context 'with error' do
    let(:errors) { { name: ['is required.'] } }

    it 'renders an error' do
      render_inline(described_class.new(form:, attribute: :name))

      expect(page).to have_content('is required.')
    end
  end
end
