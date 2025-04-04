import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "form", "title", "submitButton", "deleteButton"]
  static values = {
    postId: String,
    mode: String
  }

  connect() {
    document.addEventListener("click", (event) => {
      if (event.target === this.modalTarget) {
        this.close()
      }
    })

    // Show modal when turbo frame loads
    document.addEventListener("turbo:frame-load", (event) => {
      if (event.target.id === "post_form") {
        this.showModal()
      }
    })
  }

  open(event) {
    if (event.params && event.params.id) {
      // Edit mode
      this.postIdValue = event.params.id
      this.modeValue = "edit"
      this.titleTarget.textContent = "Edit Post"
      this.submitButtonTarget.value = "Update Post"
      this.deleteButtonTarget.classList.remove("hidden")
      this.loadPost()
    } else {
      // Create mode
      this.modeValue = "create"
      this.titleTarget.textContent = "Create New Post"
      this.submitButtonTarget.value = "Create Post"
      this.deleteButtonTarget.classList.add("hidden")
      this.formTarget.reset()
    }
    this.modalTarget.classList.remove("hidden")
    document.body.classList.add("overflow-hidden")
  }

  showModal() {
    this.modalTarget.classList.remove("hidden")
  }

  close() {
    this.modalTarget.classList.add("hidden")
    document.body.classList.remove("overflow-hidden")
    this.formTarget.reset()
  }

  async loadPost() {
    const response = await fetch(`/posts/${this.postIdValue}`, {
      headers: {
        Accept: "application/json"
      }
    })
    if (response.ok) {
      const post = await response.json()
      this.formTarget.querySelector("#post_title").value = post.title
      this.formTarget.querySelector("#post_location").value = post.location
      this.formTarget.querySelector("#post_body").value = post.body
      this.formTarget.action = `/posts/${this.postIdValue}`
      this.formTarget.insertAdjacentHTML('beforeend', '<input type="hidden" name="_method" value="patch">')
    }
  }

  async delete(event) {
    event.preventDefault()
    if (confirm("Are you sure you want to delete this post?")) {
      const response = await fetch(`/posts/${this.postIdValue}`, {
        method: "DELETE",
        headers: {
          "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
        }
      })
      if (response.ok) {
        window.location.reload()
      }
    }
  }

  handleSubmit(event) {
    if (event.detail.success) {
      this.close()
    }
  }
}
