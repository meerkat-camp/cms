import { Controller } from '@hotwired/stimulus'
import ApiClient from 'utils/ApiClient'

export default class extends Controller {
  static values = { url: String }
  static targets = [ "title", "slug" ]
  static slugManuallyChanged = false

  connect () {
    if (this.slugTarget.value !== '') {
      this.slugManuallyChanged = true
    }
  }

  generate () {
    if (this.slugManuallyChanged) { return }

    const slug = this.sluggalize(this.titleTarget.value)

    this.checkAndSetSlug(slug)
  }

  validate () {
    this.slugManuallyChanged = true
    const slug = this.slugTarget.value
    this.checkAndSetSlug(slug)
  }

  checkAndSetSlug(slug) {
    (new ApiClient).post(this.urlValue, { slug: slug }).then(response => {
      if (response.ok) {
        this.slugTarget.value = slug
      }

      if(response.status === 423) {
        response.text().then(slug => {
          this.slugTarget.value = slug
        })
      }
    })
  }

  sluggalize(text) {
    var slug = text.toLowerCase()
    slug = slug.trim()
    slug = slug.replace(/[^a-z0-9\-]+/g, '-')
    slug = slug.replace(/-+/g, '-')
    return `/${slug}`
  }
}
