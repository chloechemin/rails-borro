import { Controller } from "stimulus"

export default class extends Controller {
  static values = { userId: Number, postId: Number, bookingId: Number}
  static targets = ["review"]

  connect() {
    const image = document.getElementById("character-image")

    image.innerHTML = `<img src="/assets/characters/review-3.png">`
  }

  renderRatingImage() {
    const image = document.getElementById("character-image")

    image.innerHTML = `<img src="/assets/characters/review-${this.reviewTarget.value}.png">`
  }
}
