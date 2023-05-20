import * as Vue from "vue"
import { h } from 'vue'
import InfoWindow from '../components/InfoWindow.js'

export default {
  template: `
    <div ref="mapDiv" style=" height: 100%; width: 100%;"></div>
    <InfoWindow id="info_window" content="hellloooo"></InfoWindow>
  `,
  props: [],
  data() {
    return {
      gMap: null,
      mapCenter: null
    }
  },
  mounted() {
    this.initializeMap()
  },
  methods: {
    infowindowContent() {
      let thing = h(InfoWindow, { content: "hello" })
      console.log(thing)
      debugger
      return thing
      // const InfoWindow = Vue.component('../components/InfoWindow.js', {});
      // const myComponent = new InfoWindow({});
      // myComponent.$mount('#my-component-mountpoint');

      // // let instance = h('InfoWindow')
      // let infowindow = Vue.component(InfoWindow())
      // this.mount('InfoWindow', InfoWindow)
      
      // return h('InfoWindow')
      return "hello this still works"
    },
    initializeMap() {
      this.mapCenter = new google.maps.LatLng(45.5, -122.6)
      this.gMap = new google.maps.Map(this.$refs.mapDiv, {
        center: this.mapCenter,
        zoom: 10,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      })
      let marker = new google.maps.Marker({
        map: this.gMap,
        position: this.mapCenter,
      })
      
      // const infowindow = new google.maps.InfoWindow({ content: this.infowindowContent() })
      const infowindow = new google.maps.InfoWindow({ content: this.infowindowContent() })
      infowindow.open({
        anchor: marker,
        map: this.gMap,
      });
    },
},

  computed: {
    I18n: () => I18n
  }
}
