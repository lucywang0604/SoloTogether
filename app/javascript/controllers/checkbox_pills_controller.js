import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox", "label"]

  connect() {
    // Initialize the labels based on checkbox states
    this.checkboxTargets.forEach((checkbox, index) => {
      this.updateLabelStyle(checkbox, this.labelTargets[index])
    })
  }

  toggle(event) {
    const checkbox = event.currentTarget.querySelector('input[type="checkbox"]')
    const label = event.currentTarget.querySelector('label')

    checkbox.checked = !checkbox.checked
    this.updateLabelStyle(checkbox, label)
  }

  updateLabelStyle(checkbox, label) {
    if (checkbox.checked) {
      label.classList.add('bg-[#C14F4F]', 'text-white', 'border-[#C14F4F]')
      label.classList.remove('border-gray-300', 'hover:bg-gray-50')
    } else {
      label.classList.remove('bg-[#C14F4F]', 'text-white', 'border-[#C14F4F]')
      label.classList.add('border-gray-300', 'hover:bg-gray-50')
    }
  }
}
