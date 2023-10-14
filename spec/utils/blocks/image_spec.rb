describe Blocks::Image do
  let(:image_model) { create(:image) }
  let(:editor_js_hash) do
    {
      "id" => "kn99hrD-vP",
      "type" => "image",
      "data" => {
        "file" => { "url" => "/sites/#{image_model.site.public_id}/images/#{image_model.public_id}" },
        "caption" => "foobar",
        "withBorder" => false,
        "stretched" => false,
        "withBackground" => false
      }
    }
  end

  describe '.from_editor_js' do
    it 'returns a new instance of the class' do
      image = described_class.from_editor_js(editor_js_hash)

      expect(image.id).to eq('kn99hrD-vP')
      expect(image.type).to eq('image')
      expect(image.image_id).to eq(image_model.public_id)
      expect(image.caption).to eq("foobar")
    end
  end

  describe '#to_editor_js' do
    it 'returns the right editor js hash' do
      expect(described_class.from_editor_js(editor_js_hash).to_editor_js).to eq(editor_js_hash)
    end
  end
end
