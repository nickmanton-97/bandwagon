import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "content"]

  connect() {
    // Controller mounted
  }

  open(event) {
    event.stopPropagation()
    const modal = document.getElementById("profileModal")
    if (modal) {
      modal.classList.remove("hidden")
    }
  }

  close(event) {
    event.stopPropagation()
    const modal = document.getElementById("profileModal")
    if (modal) {
      modal.classList.add("hidden")
    }
  }

  sendInterest() {
    // Stub: Send interest request to user
  }

  populateModal(profileData) {
    // Stub: Fill modal with profile information
  }
}
