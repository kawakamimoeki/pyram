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

  currency (value) {
    const fometter = Intl.NumberFormat('ja-JP')
    return fometter.format(value)
  }

  chart () {
    const expense = this.expenseValue
    const budget = this.budgetValue
    const color = this.colorValue
    const currency = this.currency
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
        circle.setText(`
          <p style="text-align: center; padding: 0 4px;">¥ ${currency(expense)} </p>
          <p style="border: 1px solid ${color}; margin: 5px 0;"></p>
          <p style="text-align: center; padding: 0 4px;">¥ ${currency(budget)}</p>`)
      }
    })
    chart.text.style.fontWeight = "bold"
    return chart
  }
}
