import * as Vue from "vue"

const app_canvas = "#app_canvas"
const element = document.querySelector(app_canvas)
import App from './App.js'

if (element !== null) {

  const app = Vue.createApp(
    App, 
    {
      lat: Number(element.dataset.lat),
      lng: Number(element.dataset.lng),
      zoom: Number(element.dataset.zoom),
      playerName: element.dataset.playerName,
      icon: element.dataset.icon,
      playersUrl: element.dataset.playersUrl,
      playerUrl: element.dataset.playerUrl,
      playerTravelUrl: element.dataset.playerTravelUrl,
      playerAvatarUrl: element.dataset.playerAvatarUrl,
      playerState: element.dataset.playerState
    }
  )
  const vm = app.mount(app_canvas)
  
}
