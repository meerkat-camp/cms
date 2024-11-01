describe Blocks::List do
  let(:editor_js_hash) do
    { "id" => "_zLjlxHSNY",
      "type" => "list",
      "data" => {
        "style" => "ordered",
        "items" => [
          { "content" => "Hallo", "items" => [] },
          { "content" => "Welt", "items" => [{ "content" => "hallo", "items" => [] }] }
        ]
      } }
  end

  describe '.from_editor_js' do
    it 'returns a new instance with the right values' do
      list = described_class.from_editor_js(editor_js_hash)

      expect(list.id).to eq('_zLjlxHSNY')
      expect(list.type).to eq('list')
      expect(list.style).to eq('ol')
      expect(list.items).to eq(editor_js_hash['data']['items'])
    end
  end

  describe '#to_editor_js' do
    it 'returns the right editor js hash' do
      expect(described_class.from_editor_js(editor_js_hash).to_editor_js).to eq(editor_js_hash)
    end
  end
end
