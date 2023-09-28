describe Blocks::Renderer::Html::List do
  subject(:list) { described_class }

  let(:block) do
    Blocks::List.new(id: 'ge0lvZrn4o', data: { 'style' => style, 'items' => items })
  end

  describe '#to_html' do
    let(:list_html) { list.new(block).to_html }

    context 'when style is unordered' do
      let(:style) { 'unordered' }

      let(:items) do
        [
          { 'content' => 'A', 'items' => [] },
          { 'content' => 'B', 'items' => [
            { 'content' => 'B.A', 'items' => [] }
          ] }
        ]
      end

      it 'returns unordered list' do
        expect(list_html).to eq('<ul><li>A</li><li>B<ul><li>B.A</li></ul></li></ul>')
      end
    end

    context 'when style is ordered' do
      let(:style) { 'ordered' }

      let(:items) do
        [
          { 'content' => 'A', 'items' => [] },
          { 'content' => 'B', 'items' => [
            { 'content' => 'B.A', 'items' => [] }
          ] }
        ]
      end

      it 'returns unordered list' do
        expect(list_html).to eq('<ol><li>A</li><li>B<ol><li>B.A</li></ol></li></ol>')
      end
    end

    context 'with invalid content' do
      let(:style) { 'ordered' }

      let(:items) do
        [
          { 'content' => '<b>Foo</b>', 'items' => [] },
          { 'content' => "<script>alert('Bar')</script>", 'items' => [] }
        ]
      end

      it 'sanitizes the content' do
        expect(list_html).to eq("<ol><li><b>Foo</b></li><li>alert('Bar')</li></ol>")
      end
    end
  end
end
