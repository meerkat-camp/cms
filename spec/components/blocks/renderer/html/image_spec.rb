describe Blocks::Renderer::Html::Image do
  let(:image) { create(:image) }
  let(:block) do
    Blocks::Image.new(id: 'A70r8-SIog', image_id: image.public_id, caption:)
  end

  before do
    allow(image).to receive_messages(width: 10, height: 10)
    allow(Image).to receive(:find).with(image.public_id).and_return(image)
  end

  describe '#to_html' do
    let(:image_html) { described_class.new(block).to_html }

    context 'with a caption' do
      let(:caption) { 'Foobar' }

      it 'returns the html with alt-attribute and caption' do
        expect(image_html).to include("<figcaption>#{caption}</figcaption>")
        expect(image_html).to include('alt="Foobar"')
      end
    end

    context 'without a caption' do
      let(:caption) { '' }

      it 'returns the html with empty alt-attribute and no caption' do
        expect(image_html).to include('alt=""')
        expect(image_html).not_to include('<figcaption>')
      end
    end
  end
end
