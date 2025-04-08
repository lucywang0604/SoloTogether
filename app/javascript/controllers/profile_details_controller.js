import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display", "form", "birthdate", "sex", "languages"]

  connect() {
    console.log("Profile Details Controller Connected")
    console.log("Has Display Target:", this.hasDisplayTarget)
    console.log("Has Form Target:", this.hasFormTarget)
    console.log("Has Birthdate Target:", this.hasBirthdateTarget)
    console.log("Has Sex Target:", this.hasSexTarget)
    console.log("Has Languages Target:", this.hasLanguagesTarget)
    this.showDisplay()
  }

  showDisplay() {
    console.log("Showing Display")
    if (this.hasDisplayTarget) {
      this.displayTarget.classList.remove("hidden")
    } else {
      console.error("Display target not found")
    }
    if (this.hasFormTarget) {
      this.formTarget.classList.add("hidden")
    } else {
      console.error("Form target not found")
    }
  }

  showForm() {
    console.log("Showing Form")
    if (this.hasDisplayTarget) {
      this.displayTarget.classList.add("hidden")
    } else {
      console.error("Display target not found")
    }
    if (this.hasFormTarget) {
      this.formTarget.classList.remove("hidden")
    } else {
      console.error("Form target not found")
    }
    if (this.hasBirthdateTarget) {
      this.birthdateTarget.focus()
    } else {
      console.error("Birthdate target not found")
    }
  }

  cancel() {
    console.log("Canceling Form")
    this.showDisplay()
  }

  async save(event) {
    event.preventDefault()
    console.log("Saving Form")

    if (!this.hasBirthdateTarget || !this.hasSexTarget || !this.hasLanguagesTarget) {
      console.error("Missing required targets")
      return
    }

    const form = event.target
    const selectedLanguages = Array.from(this.languagesTargets)
      .filter(checkbox => checkbox.checked)
      .map(checkbox => checkbox.value)

    console.log("Selected Languages:", selectedLanguages)
    console.log("Birthdate:", this.birthdateTarget.value)
    console.log("Sex:", this.sexTarget.value)

    try {
      const response = await fetch(form.action, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
          "Accept": "application/json"
        },
        body: JSON.stringify({
          profile: {
            birthdate: this.birthdateTarget.value,
            sex: this.sexTarget.value,
            spoken_languages: selectedLanguages
          }
        })
      })

      if (!response.ok) {
        const errorData = await response.json()
        console.error("Server error:", errorData)
        throw new Error(`HTTP error! status: ${response.status}`)
      }

      const data = await response.json()
      console.log("Response Data:", data)

      // Update the display with new data
      if (this.hasDisplayTarget) {
        const ageDisplay = this.displayTarget.querySelector(".text-gray-500")
        const languagesContainer = this.displayTarget.querySelector(".flex.flex-wrap.gap-1")

        if (ageDisplay) {
          ageDisplay.textContent = `${data.age} years old • ${data.sex?.titleize || ''}`
        } else {
          console.error("Age display element not found")
        }

        if (languagesContainer) {
          languagesContainer.innerHTML = data.spoken_languages
            .map(language => `
              <span class="px-2 py-0.5 bg-gray-100 text-gray-600 text-xs rounded-full">
                ${language.toUpperCase()}
              </span>
            `)
            .join('')
        } else {
          console.error("Languages container not found")
        }
      } else {
        console.error("Display target not found")
      }

      // Show the display and hide the form
      this.showDisplay()
    } catch (error) {
      console.error("Error updating profile:", error)
      // You might want to show an error message to the user here
    }
  }
}
