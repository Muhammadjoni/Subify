import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [];

  connect() {
    console.log(this);
    // 1. select the navbar
    const navbar = document.querySelector('.navbar-lewagon')
    // 2. add a class to the navbar
    navbar.classList.add('navbar-lewagon-important')
  }
}
