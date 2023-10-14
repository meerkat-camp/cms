require 'spec_helper'

describe Blocks::Renderer::Html::Table do
  let(:block) do
    Blocks::Table.new(id: 'JXyF2m2GZQ', with_headings:, content:)
  end

  describe '#to_html' do
    let(:table_html) { described_class.new(block).to_html }

    context 'with headings' do
      let(:with_headings) { true }
      let(:content) { [%w[Foo Bar], %w[Baz Qux]] }

      it 'returns html' do
        expect(table_html).to eq(%(
          <table>
            <thead><tr><td>Foo</td><td>Bar</td></tr></thead>
            <tbody><tr><td>Baz</td><td>Qux</td></tr></tbody>
          </table>
        ).gsub(/\s+/, ''))
      end
    end

    context 'without headings' do
      let(:with_headings) { false }
      let(:content) { [%w[A B], %w[C D]] }

      it 'returns html' do
        expect(table_html).to eq(
          '<table><tbody><tr><td>A</td><td>B</td></tr><tr><td>C</td><td>D</td></tr></tbody></table>'
        )
      end
    end

    context 'with dangerous html' do
      let(:with_headings) { false }
      let(:content) { [['<b>Foo</b>', '<script>alert("hi")</script>']] }

      it 'scrubs all the cell content' do
        expect(table_html).to eq('<table><tbody><tr><td><b>Foo</b></td><td>alert("hi")</td></tr></tbody></table>')
      end
    end
  end
end
