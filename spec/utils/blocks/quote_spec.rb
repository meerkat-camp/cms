describe Blocks::Quote do
  let(:editor_js_hash) do
    {
      "id" => "1NEDFd5rjy",
      "type" => "quote",
      "data" => { "text" => "Foo", "caption" => "Bar", "alignment" => "left" }
    }
  end

  describe '.from_editor_js' do
    it 'returns a new instance with the right values' do
      quote = described_class.from_editor_js(editor_js_hash)

      expect(quote.id).to eq('1NEDFd5rjy')
      expect(quote.type).to eq('quote')
      expect(quote.text).to eq('Foo')
      expect(quote.caption).to eq('Bar')
    end
  end

  describe '#to_editor_js' do
    it 'returns the right editor js hash' do
      quote = described_class.from_editor_js(editor_js_hash)
      expect(quote.to_editor_js).to eq(editor_js_hash)
    end
  end
end
