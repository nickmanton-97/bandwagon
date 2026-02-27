import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["image", "name"]
  static values = { profileId: Number, colorClass: String }

  connect() {
    this.setupCardInteractions()
  }

  setupCardInteractions() {
    // Stub: Setup hover states, click handlers, etc.
  }

  openModal(event) {
    event.preventDefault()
    const profileId = this.element.dataset.profileId
    const modal = document.getElementById("profileModal")

    if (modal) {
      modal.classList.add("is-open")
      // TODO: Fetch profile data and populate modal
    }
  }
}
