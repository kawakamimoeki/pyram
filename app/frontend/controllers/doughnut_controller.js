import ProgressBar from 'progressbar.js'
import { Controller } from '@hotwired/stimulus'

export class DoughnutController extends Controller {
  static values = {
    color: String,
    expense: Number,
    budget: Number
  }

  connect () {
    if (this.expenseValue < this.budgetValue) {
      this.chart().animate(this.expenseValue / this.budgetValue)
    } else {
      this.chart().animate(1)
    }
  }

  chart () {
    const expense = this.expenseValue
    const budget = this.budgetValue
    const color = this.colorValue
    const chart = new ProgressBar.Circle(this.element, {
      color: color,
      trailColor: '#eee',
      trailWidth: 1,
      duration: 1400,
      easing: 'bounce',
      strokeWidth: 10,
      from: { color: color, a:0 },
      to: { color: color, a:1 },
      step: function(state, circle) {
        circle.path.setAttribute('stroke', state.color)
        circle.setText(`¥ ${expense} / ${budget}`)
      }
    })
    chart.text.style.fontWeight = "bold"
    return chart
  }
}
