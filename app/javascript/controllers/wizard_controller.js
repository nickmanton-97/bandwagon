import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step"]
  static values = { currentStep: Number }

  connect() {
    this.currentStepValue = 1
    this.setupEventListeners()
  }

  setupEventListeners() {
    this.element.querySelectorAll("button").forEach(btn => {
      const text = btn.textContent.trim().toLowerCase()

      if (text === "next") {
        btn.addEventListener("click", (e) => {
          e.preventDefault()
          this.next()
        })
      } else if (text === "back") {
        btn.addEventListener("click", (e) => {
          e.preventDefault()
          this.back()
        })
      } else if (text === "finish") {
        btn.addEventListener("click", (e) => {
          e.preventDefault()
          this.finish()
        })
      }
    })
  }

  next() {
    if (this.currentStepValue < this.stepTargets.length) {
      this.transitionToStep(this.currentStepValue + 1, "forward")
    }
  }

  back() {
    if (this.currentStepValue > 1) {
      this.transitionToStep(this.currentStepValue - 1, "backward")
    }
  }

  finish() {
    const form = this.element.closest("form")
    if (form) {
      form.submit()
    }
  }

  transitionToStep(stepNumber, direction) {
    const currentStep = this.getStepElement(this.currentStepValue)
    const nextStep = this.getStepElement(stepNumber)

    // Close the mask (shrink width to 0)
    gsap.to(currentStep, {
      duration: 0.15,
      width: 0,
      ease: "power2.out",
      onComplete: () => {
        currentStep.classList.remove("active")
        nextStep.classList.add("active")

        // Open the mask (expand width back to 100%)
        gsap.to(nextStep, {
          duration: 0.15,
          width: "100%",
          ease: "power2.out"
        })
      }
    })

    this.currentStepValue = stepNumber
  }

  getStepElement(stepNumber) {
    return this.stepTargets[stepNumber - 1]
  }
}
