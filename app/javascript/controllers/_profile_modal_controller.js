import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "overlay"]

  connect() {
    // Modal mounted
  }

  close(event) {
    event.preventDefault()
    const modal = this.element
    modal.classList.remove("is-open")
  }

  sendInterest() {
    // Stub: Send interest request to user
  }

  populateModal(profileData) {
    // Stub: Fill modal with profile information
  }
}
