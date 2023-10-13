describe Blocks::Table do
  let(:editor_js_hash) do
    {
      "id" => "MBNF7cRLP6",
      "type" => "table",
      "data" => { "withHeadings" => false, "content" => [%w[Hallo Welt]] }
    }
  end

  describe '.from_editor_js' do
    it 'returns a new instance of the class' do
      table = described_class.from_editor_js(editor_js_hash)

      expect(table.type).to eq('table')
      expect(table.id).to eq('MBNF7cRLP6')
      expect(table.with_headings).to be_falsey
      expect(table.content).to eq([%w[Hallo Welt]])
    end
  end

  describe '#to_editor_js' do
    it 'returns the right editor js hash' do
      expect(described_class.from_editor_js(editor_js_hash).to_editor_js).to eq(editor_js_hash)
    end
  end
end
