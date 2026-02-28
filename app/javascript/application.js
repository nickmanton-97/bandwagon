import "@hotwired/turbo-rails"

document.addEventListener("DOMContentLoaded", () => {
  const modal = document.getElementById("authModal");
  const openButtons = document.querySelectorAll("[data-modal-target]");
  const closeButton = modal.querySelector(".close-button");
  const signupTab = document.getElementById("signup-tab");
  const loginTab = document.getElementById("login-tab");
  const signupForm = document.getElementById("signup-form");
  const loginForm = document.getElementById("login-form");

  openButtons.forEach(btn => btn.addEventListener("click", () => modal.classList.remove("hidden")));
  closeButton.addEventListener("click", () => modal.classList.add("hidden"));
  window.addEventListener("click", e => { if(e.target == modal) modal.classList.add("hidden"); });

  signupTab.addEventListener("click", () => {
    signupTab.classList.add("active");
    loginTab.classList.remove("active");
    signupForm.classList.add("active");
    loginForm.classList.remove("active");
  });

  loginTab.addEventListener("click", () => {
    loginTab.classList.add("active");
    signupTab.classList.remove("active");
    loginForm.classList.add("active");
    signupForm.classList.remove("active");
  });
});
