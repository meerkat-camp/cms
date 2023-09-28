describe Form::TextFieldComponent, type: :component do
  let(:form) { spy(:form, object: double(errors:)) }

  context 'without error' do
    let(:errors) { { name: [] } }

    it 'renders a normal text field' do
      render_inline(described_class.new(form:, attribute: :name))

      expect(page).to have_css('.field')
      expect(page).not_to have_css('p.help')
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
