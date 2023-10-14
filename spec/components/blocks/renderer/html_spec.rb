describe Blocks::Renderer::Html do
  subject(:converter) { described_class }

  describe '.convert' do
    it 'converts editor js to html' do
      html = converter.render(
        [
          Blocks::Paragraph.new(id: 'JXyF2m2GZQ', text: 'Foo'),
          Blocks::Paragraph.new(id: 'Ufe53LgSM4', text: 'Bar')
        ]
      )
      expect(html).to eq('<p>Foo</p><p>Bar</p>')
    end
  end
end
