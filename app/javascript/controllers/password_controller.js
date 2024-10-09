export default class extends Controller {
  static targets = ["password", "toggleIcon"];

  toggle() {
    const type = this.passwordTarget.getAttribute("type") === "password" ? "text" : "password";
    this.passwordTarget.setAttribute("type", type);
    this.updateIcon();
  }

  updateIcon() {
     if (this.passwordTarget.getAttribute("type") === "password") {
       this.toggleIconTarget.classList.remove("mdi-eye-off");
       this.toggleIconTarget.classList.add("mdi-eye");
     } else {
       this.toggleIconTarget.classList.remove("mdi-eye");
       this.toggleIconTarget.classList.add("mdi-eye-off");
     }
   }
}
