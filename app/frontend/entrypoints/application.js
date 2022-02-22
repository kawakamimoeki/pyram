import '../css/main.css'
import '../images/logo.png'
import '@rails/ujs'
import { Application } from '@hotwired/stimulus'
import { LineController } from '../controllers/line_controller'
import { DoughnutController } from '../controllers/doughnut_controller'
import { CardsController } from '../controllers/cards_controller'
import { AddtionController } from '../controllers/addition_controller'
import { ColorizeController } from '../controllers/colorize_controller'
import { ExpenseFieldController } from '../controllers/expense_field_controller'

const application = Application.start()
application.register('line', LineController)
application.register('doughnut', DoughnutController)
application.register('cards', CardsController)
application.register('addition', AddtionController)
application.register('colorize', ColorizeController)
application.register('expense-field', ExpenseFieldController)
