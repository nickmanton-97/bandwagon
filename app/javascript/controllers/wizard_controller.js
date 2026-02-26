import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step"]
  static values = { currentStep: Number }

  connect() {
    this.currentStepValue = 1
    this.setupEventListeners()
  }

  setupEventListeners() {
    // Find all next/back/finish buttons within the wizard
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
      this.transitionToStep(this.currentStepValue + 1)
    }
  }

  back() {
    if (this.currentStepValue > 1) {
      this.transitionToStep(this.currentStepValue - 1)
    }
  }

  finish() {
    // Submit the form
    const form = this.element.closest("form")
    if (form) {
      form.submit()
    }
  }

  transitionToStep(stepNumber) {
    const currentStep = this.getStepElement(this.currentStepValue)
    const nextStep = this.getStepElement(stepNumber)
    const direction = stepNumber > this.currentStepValue ? 1 : -1

    // Animate out current step
    gsap.to(currentStep, {
      duration: 0.3,
      opacity: 0,
      x: direction * -30,
      onComplete: () => {
        currentStep.classList.remove("active")
        nextStep.classList.add("active")

        // Animate in next step
        gsap.fromTo(
          nextStep,
          { opacity: 0, x: direction * 30 },
          { duration: 0.3, opacity: 1, x: 0 }
        )
      }
    })

    this.currentStepValue = stepNumber
  }

  getStepElement(stepNumber) {
    return this.stepTargets[stepNumber - 1]
  }
}
