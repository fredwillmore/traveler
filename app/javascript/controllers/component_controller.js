import * as Vue from "vue"

const app_canvas = "#app_canvas"
const element = document.querySelector(app_canvas)
import App from './App.js'

if (element !== null) {

  // debugger
  const app = Vue.createApp(
    App, 
    {
      lat: Number(element.dataset.lat),
      lng: Number(element.dataset.lng),
      zoom: Number(element.dataset.zoom),
      playersUrl: element.dataset.playersUrl
    }
  )
  const vm = app.mount(app_canvas)
}