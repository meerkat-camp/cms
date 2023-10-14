describe Blocks::Renderer::Html::Code do
  describe '#to_html' do
    it 'wraps html' do
      expect(html('foo')).to eq('<pre>foo</pre>')
    end

    it 'escapes all code' do
      expect(html('<script>')).to eq("<pre>&lt;script&gt;</pre>")
    end
  end

  def html(code)
    code_block = Blocks::Code.new(id: 'JXyF2m2GZQ', code:)
    described_class.new(code_block).to_html
  end
end
