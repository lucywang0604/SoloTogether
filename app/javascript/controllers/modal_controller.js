import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    // Add event listener for escape key
    document.addEventListener("keydown", this.handleKeydown.bind(this))
  }

  disconnect() {
    // Clean up event listener
    document.removeEventListener("keydown", this.handleKeydown.bind(this))
  }

  open() {
    this.containerTarget.classList.remove("hidden")
    document.body.classList.add("overflow-hidden")
  }

  close() {
    this.containerTarget.classList.add("hidden")
    document.body.classList.remove("overflow-hidden")
  }

  closeBackground(event) {
    // Only close if clicking directly on the background (container)
    if (event.target === this.containerTarget) {
      this.close()
    }
  }

  handleKeydown(event) {
    if (event.key === "Escape" && !this.containerTarget.classList.contains("hidden")) {
      this.close()
    }
  }
}
