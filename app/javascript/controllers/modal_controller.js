import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['modal']

  open () {
    this.modalTarget.showModal()
    document.body.classList.add('is-clipped')
  }

  close () {
    this.modalTarget.close()
    document.body.classList.remove('is-clipped')
  }
}
