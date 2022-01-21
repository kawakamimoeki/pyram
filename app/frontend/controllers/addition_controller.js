import { Controller } from '@hotwired/stimulus'

export class AddtionController extends Controller {
  static targets = ['input', 'destination']

  call () {
    let sum = 0
    this.inputTargets.forEach(ele => {
      const input = parseInt(ele.value)
      if (input === NaN) input = 0
      sum += input
    })
    if (!sum) sum = 0
    this.destinationTarget.value= sum
  }
}
