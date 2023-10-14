describe Blocks::Renderer::Html::Quote do
  let(:block) do
    Blocks::Quote.new(id: 'wu38wGs5jz', text:, caption:)
  end
  let(:quote) { described_class.new(block) }

  describe '#to_html' do
    context 'with a caption' do
      let(:text) { 'Foo <b>Bar</b>' }
      let(:caption) { 'Baz' }

      it 'returns a blockquote with cite' do
        expect(quote.to_html).to eq('<blockquote><p>Foo <b>Bar</b></p><cite>Baz</cite></blockquote>')
      end
    end

    context 'without caption' do
      let(:text) { 'Foo!' }
      let(:caption) { '' }

      it 'returns a blockquote without cite' do
        expect(quote.to_html).to eq('<blockquote><p>Foo!</p></blockquote>')
      end
    end

    context 'with dangerous html' do
      let(:text) { '<script>Foo</script>' }
      let(:caption) { '<script>Bar</script>' }

      it 'sanizites the html' do
        expect(quote.to_html).to eq('<blockquote><p>Foo</p><cite>Bar</cite></blockquote>')
      end
    end
  end
end
