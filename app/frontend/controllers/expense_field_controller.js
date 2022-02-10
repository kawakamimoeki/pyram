import { Controller } from '@hotwired/stimulus'

export class ExpenseFieldController extends Controller {
  static targets = ['all', 'required', 'affluent']

  call (event) {
    if (event.target === this.affluentTarget) {
      this.requiredTarget.value = this.allTarget.value - this.affluentTarget.value
    } else if (event.target === this.requiredTarget) {
      this.affluentTarget.value = this.allTarget.value - this.requiredTarget.value
    }
  }
}
