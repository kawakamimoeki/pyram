import Chart from 'chart.js/auto'
import { Controller } from '@hotwired/stimulus'

export class LineController extends Controller {
  static values = {
    days: Array,
    payments: Array,
    budgets: Array
  }

  connect () {
    new Chart(
      this.element,
      {
        type: 'line',
        data: {
          labels: this.daysValue,
          datasets: [
            {
              label: '支出',
              backgroundColor: '#fb923c',
              borderColor: '#fb923c',
              data: this.paymentsValue,
              pointStyle: 'line'
            },
            {
              label: '予算',
              backgroundColor: '#a78bfa',
              borderColor: '#a78bfa',
              data: this.budgetsValue,
              pointStyle: 'line'
            }
          ]
        }
      }
    )
  }
}
