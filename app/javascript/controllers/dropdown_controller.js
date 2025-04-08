import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "menuItem"]
  static values = {
    open: { type: Boolean, default: false }
  }

  connect() {
    this.menuTarget.classList.add("hidden")
    this.menuTarget.classList.add("absolute")
    this.menuTarget.classList.add("right-0")
    this.menuTarget.classList.add("z-10")
    this.menuTarget.classList.add("mt-2")
    this.menuTarget.classList.add("w-48")
    this.menuTarget.classList.add("rounded-md")
    this.menuTarget.classList.add("bg-white")
    this.menuTarget.classList.add("py-1")
    this.menuTarget.classList.add("shadow-lg")
    this.menuTarget.classList.add("ring-1")
    this.menuTarget.classList.add("ring-black")
    this.menuTarget.classList.add("ring-opacity-5")
  }

  toggle(event) {
    event.stopPropagation()
    this.openValue = !this.openValue
    this.menuTarget.classList.toggle("hidden")
  }

  hide(event) {
    if (this.element.contains(event.target)) return
    this.openValue = false
    this.menuTarget.classList.add("hidden")
  }

  previousItem(event) {
    if (event.key !== "ArrowUp") return
    event.preventDefault()
    const items = this.menuItemTargets
    const currentIndex = items.indexOf(document.activeElement)
    const previousIndex = currentIndex > 0 ? currentIndex - 1 : items.length - 1
    items[previousIndex].focus()
  }

  nextItem(event) {
    if (event.key !== "ArrowDown") return
    event.preventDefault()
    const items = this.menuItemTargets
    const currentIndex = items.indexOf(document.activeElement)
    const nextIndex = currentIndex < items.length - 1 ? currentIndex + 1 : 0
    items[nextIndex].focus()
  }
}
