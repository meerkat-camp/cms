describe Blocks::Paragraph do
  let(:editor_js_hash) do
    { "id" => "jGoevTELVm", "type" => "paragraph", "data" => { "text" => "hallo" } }
  end

  describe '.from_editor_js' do
    it 'returns a new instance with the right values' do
      paragraph = described_class.from_editor_js(editor_js_hash)

      expect(paragraph.id).to eq('jGoevTELVm')
      expect(paragraph.text).to eq('hallo')
    end
  end

  describe '#to_editor_js' do
    it 'returns the right editor js hash' do
      code = described_class.from_editor_js(editor_js_hash)
      expect(code.to_editor_js).to eq(editor_js_hash)
    end
  end
end
