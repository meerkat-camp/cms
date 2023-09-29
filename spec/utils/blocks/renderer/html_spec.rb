describe Blocks::Renderer::Html do
  subject(:converter) { described_class }

  describe '.convert' do
    it 'converts editor js to html' do
      expect(converter.render(
               [
                 Blocks::Paragraph.new(id: 'JXyF2m2GZQ', data: { 'text' => 'Foo' }),
                 Blocks::Paragraph.new(id: 'Ufe53LgSM4', data: { 'text' => 'Bar' })
               ]
             )).to eq('<p>Foo</p><p>Bar</p>')
    end
  end
end
