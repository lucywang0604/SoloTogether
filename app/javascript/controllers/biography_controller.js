import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display", "form", "input"]

  connect() {
    this.showDisplay()
  }

  showDisplay() {
    this.displayTarget.classList.remove("hidden")
    this.formTarget.classList.add("hidden")
  }

  showForm() {
    this.displayTarget.classList.add("hidden")
    this.formTarget.classList.remove("hidden")
    this.inputTarget.focus()
  }

  cancel() {
    this.showDisplay()
  }

  async save(event) {
    event.preventDefault()
    const form = event.target
    const response = await fetch(form.action, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({
        profile: {
          biography: this.inputTarget.value
        }
      })
    })

    if (response.ok) {
      const data = await response.json()
      this.displayTarget.textContent = data.biography || "No biography yet"
      this.showDisplay()
    }
  }
}
