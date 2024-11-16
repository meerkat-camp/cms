export default class EditorJsContentLengthCalculator {
  UnsupportedBlockError = class extends Error {
    constructor (block) {
      super(`Unsupported block type: ${block.type}`)
    }
  }

  BLOCK_CALCULATORS = {
    code: this.lengthForCodeBlock,
    header: this.lengthForHeaderBlock,
    image: this.lengthForImageBlock,
    list: this.lengthForListBlock.bind(this),
    paragraph: this.lengthForParagraphBlock,
    quote: this.lengthForQuoteBlock,
    table: this.lengthForTableBlock
  }

  constructor (blocks) {
    this.blocks = blocks
  }

  length () {
    this.blocks.forEach(block => {
      if (!this.BLOCK_CALCULATORS[block.type]) {
        throw new this.UnsupportedBlockError(block)
      }
    })

    return this.blocks.reduce((sum, block) => {
      return sum + this.BLOCK_CALCULATORS[block.type](block)
    }, 0)
  }

  lengthForCodeBlock (block) {
    return block.data.code.length
  }

  lengthForParagraphBlock (block) {
    return block.data.text.length
  }

  lengthForHeaderBlock (block) {
    return block.data.text.length
  }

  lengthForQuoteBlock (block) {
    return block.data.text.length + block.data.caption.length
  }

  lengthForTableBlock (block) {
    return block.data.content.reduce((sum, row) => {
      return sum + row.reduce((rowSum, cell) => {
        return rowSum + cell.length
      }, 0)
    }, 0)
  }

  lengthForListBlock (block) {
    return block.data.items.reduce((sum, item) => {
      return sum + this.lengthForListItem(item)
    }, 0)
  }

  lengthForListItem (item) {
    return item.content.length + item.items.reduce((sum, nestedItem) => {
      return sum + this.lengthForListItem(nestedItem)
    }, 0)
  }

  lengthForImageBlock (block) {
    return block.data.caption.length
  }
}
