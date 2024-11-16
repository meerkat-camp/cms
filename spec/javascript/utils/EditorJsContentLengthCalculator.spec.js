import { describe, it, expect } from '@jest/globals'

import EdirorJsContentLengthCalculator from '@/utils/EditorJsContentLengthCalculator'

const BLOCK_EXAMPLES = [
  {
    block: {
      type: 'paragraph',
      data: { text: 'Hello, world!' }
    },
    length: 13
  },
  {
    block: {
      type: 'header',
      data: { text: 'Foobar' }
    },
    length: 6
  },
  {
    block: {
      type: 'code',
      data: { code: 'hallo', language: 'ruby' }
    },
    length: 5
  },
  {
    block: {
      type: 'quote',
      data: { text: 'Foo', caption: 'Bar', alignment: 'left' }
    },
    length: 6
  },
  {
    block: {
      type: 'table',
      data: { withHeadings: false, content: [['Hallo', 'Welt'], ['Foo', 'Blub']] }
    },
    length: 16
  },
  {
    block: {
      type: 'list',
      data: {
        style: 'ordered',
        items: [
          {
            content: 'Hallo', items: []
          },
          {
            content: 'Welt',
            items: [{
              content: 'Foobar',
              items: []
            }]
          }
        ]
      }
    },
    length: 15
  },
  {
    block: {
      type: 'image',
      data: {
        file: {
          url: 'https://example/image.jpg'
        },
        caption: 'Foo'
      }
    },
    length: 3
  }
]

describe('EditorJsContentLengthCalculator', () => {
  describe('with unsupported blocks', () => {
    it('throws an error', () => {
      expect(() => {
        new EdirorJsContentLengthCalculator([{ type: 'unsupported' }]).length()
      }).toThrow(EdirorJsContentLengthCalculator.UnsupportedBlockError)
    })
  })

  BLOCK_EXAMPLES.forEach(({ block, length }) => {
    it(`calculates length for ${block.type}`, () => {
      const calculator = new EdirorJsContentLengthCalculator([block])
      expect(calculator.length()).toEqual(length)
    })
  })
})
