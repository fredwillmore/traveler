import * as Vue from "vue"
import axios from "axios"

const map_canvas = "#map_canvas"
const element = document.querySelector(map_canvas)

if (element !== null) {

  const app = Vue.createApp({
    // template() {
    // },
    data() {
      return {
        count: 1,
        gMap: null,
        placesService: null,
        liveMarkers: []
      }
    },
    created() {
      console.log("count is: "+ this.count) // => "count is: 1"
      this.initializeMap()
    },
    methods: {
      initializeMap() {
        this.gMap = new google.maps.Map(element, {
          center: {
            lat: Number(element.dataset.lat),
            lng: Number(element.dataset.lng)
          },
          zoom: Number(element.dataset.zoom),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        });
        this.placesService = new google.maps.places.PlacesService(this.gMap);
        
        axios.request(
          document.querySelector("#players_index").dataset.ajaxPath
        ).then((response) => {
          console.log('hello I am the ajaxPlayerIndexHandler')
          // var current = $.grep(data, function(item) {
          //   return item.is_current_player === true;
          // })[0];
          // // return $.updateBoardForPlayer(current);
        })
        // $.ajax({
        //   url: $("#players_index").data('ajaxPath'),
        //   data: {},
        //   dataType: 'json',
        //   success: function(data) {
        //     return $.ajaxPlayerIndexHandler(data);
        //   }
        // });
      }
    },
    ajaxPlayerIndexHandler(data) {
      console.log('hello I am the ajaxPlayerIndexHandler')
    },
    computed: {
      // TODO: I don't think this needs to be a computed method
      // initializeMap() {
      //   const map = new google.maps.Map(element, {
      //     center: { lat: -34.397, lng: 150.644 },
      //     zoom: 8,
      //   });
      // }
    }
  })
  const vm = app.mount(map_canvas)
}