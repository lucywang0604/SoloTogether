import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  submit() {
    // Add a small delay to prevent too many requests
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 300)
  }
}
