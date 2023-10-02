import { Controller } from '@hotwired/stimulus'

const noticeTimeout = 10000

export default class extends Controller {
  connect () {
    setTimeout(() => { this.close() }, noticeTimeout)
  }

  close () {
    this.element.remove()
  }
}
