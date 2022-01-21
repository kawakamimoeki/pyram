import Swiper from 'swiper/bundle'
import 'swiper/css/bundle'
import { Controller } from '@hotwired/stimulus'

export class CardsController extends Controller {
  connect () {
    new Swiper(this.element, {
      grabCursor: true,
      effect: "cards",
    })
  }
}
