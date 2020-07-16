import { Controller } from "stimulus";
export default class extends Controller {
  static targets = [ 'hide'];
  connect() {
    console.log(this.hideTarget);
  }
  hide(event) {
    if (this.hideTarget.style.display == "none") {
      this.hideTarget.style.display = "block"
    } else {
      this.hideTarget.style.display = "none";
    }
  }
}