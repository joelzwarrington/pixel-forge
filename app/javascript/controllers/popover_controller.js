import { Controller } from "@hotwired/stimulus";
import tippy from "tippy.js";

export default class extends Controller {
  static targets = ["template", "activator"];

  connect() {
    tippy(this.activatorTarget, { content: this.templateTarget.innerHTML });
  }
}
