describe Blocks::Renderer::Html::Code do
  describe '#to_html' do
    it 'wraps html' do
      expect(html('foo')).to eq('<pre><code>foo</code></pre>')
    end

    it 'escapes all code' do
      expect(html('<script>')).to eq("<pre><code>&lt;script&gt;</code></pre>")
    end
  end

  def html(code)
    code_block = Blocks::Code.new(id: 'JXyF2m2GZQ', code:)
    described_class.new(code_block).to_html
  end
end
