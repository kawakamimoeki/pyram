import { Controller } from '@hotwired/stimulus'

export class ExpenseFieldController extends Controller {
  static targets = ['all', 'required', 'affluent']

  call () {
    this.affluentTarget.value = this.allTarget.value - this.requiredTarget.value
  }
}
