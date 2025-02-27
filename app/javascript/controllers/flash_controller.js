import { Controller } from "@hotwired/stimulus";
import { useTransition } from "stimulus-use";

export default class extends Controller {
  connect() {
    useTransition(this, { element: this.element });
    this.enter();

    setTimeout(() => this.dismiss(), 2000);
  }

  dismiss() {
    this.leave();
  }
}
