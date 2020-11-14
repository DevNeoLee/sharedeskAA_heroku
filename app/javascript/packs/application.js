// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require('popper.js')
require('bootstrap')
global.toastr = require("toastr")
require("jquery-ui")
require('animate.css')

// import '@fortawesome/fontawesome-svg-core';
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.

// FontAwesome.config.mutateApproach = 'sync'
import "@fortawesome/fontawesome-free/js/all";

// import { config, library, dom } from '@fortawesome/fontawesome-svg-core'


import "controllers"

// google map api with Stimulus.js
window.dispatchMapsEvent = function (...args) {
  const event = document.createEvent("Events")
  event.initEvent("google-maps-callback", true, true)
  event.args = args
  window.dispatchEvent(event)
}

//css
import 'scss/site'

//JS
import('js/site')

//Images
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)