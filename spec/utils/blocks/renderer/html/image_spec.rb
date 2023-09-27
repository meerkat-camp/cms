require 'rails_helper'

describe Blocks::Renderer::Html::Image do
  let(:image) { instance_double(Image, id: '32cf5349-caf8-42f6-9674-3ca22c55f4ba', height: 10, width: 10) }
  let(:image_url) { "/images/#{image.id}" }
  let(:block) do
    Blocks::Image.new(id: 'A70r8-SIog', data: { "file" => { "url" => image_url }, "caption" => caption })
  end

  before do
    allow(Image).to receive(:find).with(image.id).and_return(image)
  end

  describe '#to_html' do
    let(:image_html) { described_class.new(block).to_html }

    context 'with a caption' do
      let(:caption) { 'Foobar' }

      it 'returns the html with alt-attribute and caption' do
        expect(image_html).to eq(%(
          <figure>
            <img src="#{image_url}" loading="lazy" height="10" width="10" alt="Foobar" />
            <figcaption>#{caption}</figcaption>
          </figure>
        ).split("\n").map(&:strip).join)
      end
    end

    context 'without a caption' do
      let(:caption) { '' }

      it 'returns the html with empty alt-attribute and no caption' do
        expect(image_html).to eq(%(
          <figure>
            <img src="#{image_url}" loading="lazy" height="10" width="10" alt="" />
          </figure>
        ).split("\n").map(&:strip).join)
      end
    end
  end
end
