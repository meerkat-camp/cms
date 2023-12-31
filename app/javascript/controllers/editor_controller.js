import { Controller } from '@hotwired/stimulus'

import EditorJS from '@editorjs/editorjs'
import NestedList from '@editorjs/nested-list'
import Quote from '@editorjs/quote'
import Underline from '@editorjs/underline'
import Table from '@editorjs/table'
import InlineCode from '@editorjs/inline-code'
import ImageTool from '@editorjs/image'
import Header from '@editorjs/header'
import Code from '@editorjs/code'

export default class extends Controller {
  static values = {
    editorId: String,
    imageEndpoint: String,
    imageFromUrlEndpoint: String
  }

  static targets = ['jsonOutput']
  static editor = null

  connect () {
    this.editor = new EditorJS({
      holder: this.editorIdValue,
      data: this.loadData(),
      tools: this.toolsConfig(),
      onChange: (api, _event) => { this.saveData(api) }
    })
  }

  toolsConfig () {
    return {
      header: { class: Header, config: { levels: [2, 3, 4], defaultLevel: 2 } },
      image: {
        class: ImageTool,
        config: {
          endpoints: {
            byFile: this.imageEndpointValue,
            byUrl: this.imageFromUrlEndpointValue
          }
        }
      },
      quote: { class: Quote, inlineToolbar: true },
      list: { class: NestedList, inlineToolbar: true },
      underline: Underline,
      table: { class: Table, inlineToolbar: true },
      inlineCode: { class: InlineCode },
      code: Code
    }
  }

  loadData () {
    if (this.jsonOutputTarget.value === '') { return {} }

    return JSON.parse(this.jsonOutputTarget.value)
  }

  saveData (api) {
    api.saver.save().then((data) => {
      this.jsonOutputTarget.value = JSON.stringify(data)
    })
  }
}
