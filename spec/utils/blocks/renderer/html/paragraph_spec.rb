require 'rails_helper'

describe Blocks::Renderer::Html::Paragraph do
  subject(:paragraph) { described_class }

  let(:block) do
    Blocks::Paragraph.new(id: 'JXyF2m2GZQ', data: { "text" => text })
  end

  describe '#to_html' do
    let(:paragraph_html) { paragraph.new(block).to_html }

    context 'for a simple paragraph' do
      let(:text) { 'Foo' }

      it 'returns html' do
        expect(paragraph_html).to eq('<p>Foo</p>')
      end
    end

    context 'for allowed inline tags' do
      let(:text) do
        [
          '<b>Hallo</b>',
          '<i>Welt</i>',
          '<u>Foo</u>',
          '<a href="https://example.com">Bar</a>'
        ].join(' ')
      end

      it 'returns the sanitized inline tags' do
        expect(paragraph_html).to eq("<p>#{text}</p>")
      end
    end

    context 'for disallowed inline tags' do
      let(:text) do
        [
          "<script>alert('foo')</script>",
          "<a href='javascript:alert(1)'>Bar</a>",
          "<u onclick='alert(1)' class='blub'>Foo</u>"
        ].join(' ')
      end

      it 'scrubs the html' do
        expect(paragraph_html).to eq("<p>alert('foo') <a>Bar</a> <u>Foo</u></p>")
      end
    end
  end
end
