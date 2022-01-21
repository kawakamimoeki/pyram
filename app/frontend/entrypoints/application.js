import '../css/main.css'
import { Application } from '@hotwired/stimulus'
import { LineController } from '../controllers/line_controller'
import { DoughnutController } from '../controllers/doughnut_controller'
import { CardsController } from '../controllers/cards_controller'
import { AddtionController } from '../controllers/addition_controller'

const application = Application.start()
application.register('line', LineController)
application.register('doughnut', DoughnutController)
application.register('cards', CardsController)
application.register('addition', AddtionController)
