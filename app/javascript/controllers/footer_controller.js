import { Controller } from "stimulus";
export default class extends Controller {
  static targets = [ 'hide'];
  connect() {
    console.log(this.hideTarget);
  }
  hide(event) {
    if (this.hideTarget.style.display == "block") {
      this.hideTarget.style.display = "none"
    } else {
      this.hideTarget.style.display = "block";
    }
  }
}