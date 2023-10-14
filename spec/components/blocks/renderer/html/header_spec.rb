describe Blocks::Renderer::Html::Header do
  subject(:paragraph) { described_class }

  let(:block) do
    Blocks::Header.new(id: 'JXyF2m2GZQ', text:, level:)
  end

  describe '#to_html' do
    let(:header_html) { paragraph.new(block).to_html }

    context 'with allowed level' do
      let(:level) { 2 }
      let(:text) { 'Foo' }

      it 'returns html' do
        expect(header_html).to eq('<h2>Foo</h2>')
      end
    end

    context 'with disallowed level' do
      let(:level) { 1 }
      let(:text) { 'Foo' }

      it 'returns 2 as default level' do
        expect(header_html).to eq('<h2>Foo</h2>')
      end
    end

    context 'for dangerous text' do
      let(:level) { 2 }
      let(:text) { "<script>alert('foo')</script><i>Foo</i>" }

      it 'scrubs the html' do
        expect(header_html).to eq("<h2>alert('foo')<i>Foo</i></h2>")
      end
    end
  end
end
