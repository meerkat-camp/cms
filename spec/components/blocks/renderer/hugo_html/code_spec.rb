describe Blocks::Renderer::HugoHtml::Code do
  subject(:renderer) { described_class.new(block) }

  let(:block) { instance_double(Blocks::Code, language: 'ruby', code: 'puts bla') }

  describe '#render' do
    it 'renders the code block' do
      expect(renderer.to_html).to eq('{{< highlight ruby >}}puts bla{{< / highlight >}}')
    end
  end
end
