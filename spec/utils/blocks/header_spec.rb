describe Blocks::Header do
  let(:editor_js_hash) do
    {
      "id" => "BCnK-Plgw1", "type" => "header",
      "data" => { "text" => "Foo Bar", "level" => 3 }
    }
  end

  describe '.from_editor_js' do
    it 'returns a new instance of the class' do
      header = described_class.from_editor_js(editor_js_hash)

      expect(header.type).to eq('header')
      expect(header.id).to eq('BCnK-Plgw1')
      expect(header.text).to eq("Foo Bar")
      expect(header.level).to eq(3)
    end
  end

  describe '#to_editor_js' do
    it 'returns the right editor js hash' do
      expect(described_class.from_editor_js(editor_js_hash).to_editor_js).to eq(editor_js_hash)
    end
  end
end
