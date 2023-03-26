import axios from "axios"

const element = document.querySelector("#app_canvas")

export default {
    template: `
      <div id="top_nav" class="row">
        <div id="left" class="col-xs-4">
          <a href="#" id="players_index">{{I18n.get_players_index}}</a>
          {{I18n.current_player}}: {{playerName}}
        </div>
        <div class="center col-xs-4">
          <a href="#" id="show_search" class="fancybox">{{I18n.search_map}}</a>
        </div>
        <div class="right col-xs-4">
          <a href="#" id="map_control_center" class="fancybox">{{I18n.map_control_center}}</a>
        </div>
      </div>
      <div id="#map_div" ref="mapDiv" style=" height: 100%; width: 100%;"></div>
      <div id="search">
        <div class="field">
          <label for="term_"></label>
          <input
            v-model="searchTerm"
            @input="getSearchSuggestions"
          />
          <ul
            v-show="searchIsOpen"
            class="autocomplete-results"
          >
            <li
              v-for="(result, i) in searchSuggestions"
              :key="i"
              class="autocomplete-result"
              @click="searchMap(result)"
            >
              {{ result }}
            </li>
          </ul>
        </div>
      </div>
      <div id="place_info" v-if="showPlaceInfo">
        <div id="place_info_handle" class="handle">
          <a v-on:click="hidePlaceInfo" href="#">[ x ]</a>
          {{I18n.place_info.label}}
          <div id="place_info_content">
            <table>
              <tr>
                <td>{{I18n.place_info.id}}:</td>
                <td>{{placeInfo.id}}</td>
              </tr>
              <tr>
                <td>{{I18n.place_info.name}}:</td>
                <td>{{placeInfo.name}}</td>
              </tr>
              <tr>
                <td>{{I18n.place_info.rating}}:</td>
                <td>{{placeInfo.rating}}</td>
              </tr>
              <tr>
                <td>{{I18n.place_info.travel_time_walking}}:</td>
                <td>{{travelTimes.walking}}</td>
                <td>
                  <input type="button" :value="I18n.place_info.go" data-travel-mode="walking" v-on:click="doAction" />
                </td>
              </tr>
              <tr>
                <td>{{I18n.place_info.travel_time_bicycling}}:</td>
                <td>{{travelTimes.bicycling}}</td>
                <td>
                  <input type="button" :value="I18n.place_info.go" data-travel-mode="bicycling" v-on:click="doAction" />
                </td>
              </tr>
              <tr>
                <td>{{I18n.place_info.travel_time_driving}}:</td>
                <td>{{travelTimes.driving}}</td>
                <td>
                  <input type="button" :value="I18n.place_info.go" data-travel-mode="driving" v-on:click="doAction" />
                </td>
              </tr>
              <tr>
                <td>{{I18n.place_info.travel_time_transit}}:</td>
                <td>{{travelTimes.transit}}</td>
                <td>
                  <input type="button" :value="I18n.place_info.go" data-travel-mode="transit" v-on:click="doAction" />
                </td>
              </tr>
              <tr>
                <td>{{I18n.place_info.food_value}}/{{I18n.place_info.food_cost}}:</td>
                <td>
                  {{placeInfo.foodValue}} / {{placeInfo.foodCost}}
                </td>
              </tr>
              <tr>
                <td>{{I18n.place_info.drink_value}}/{{I18n.place_info.drink_cost}}:</td>
                <td>
                  {{placeInfo.drinkValue}} / {{placeInfo.drinkCost}}
                </td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    `,
    props: [
      'lat',
      'lng',
      'zoom',
      'icon',
      'playerName',
      'playerUrl',
      'playersUrl',
      'playerTravelUrl',
      'playerAvatarUrl'
    ],
    data() {
      return {
        gMap: null,
        placesService: null,
        distanceMatrix: null,
        directionsService: null,
        playerName: null,
        searchTerm: '',
        searchSuggestions: [],
        searchIsOpen: false,
        placeReference: null, // I don't necessarily like this
        showPlaceInfo: false,
        travelTimes: {
          walking: null,
          bicycling: null,
          driving: null,
          transit: null
        },
        mapCenter: new google.maps.LatLng(this.lat, this.lng),
        placeInfo: {
          id: null,
          name: null,
          rating: null,
          // travelTimeWalking: null,
          // travelTimeBicycling: null,
          // travelTimeDriving: null,
          // travelTimeTransit: null,
          foodValue: null,
          foodCost: null,
          drinkValue: null,
          drinkCost: null,
        },
      }
    },
    liveMarkers: [],

    mounted() {
      this.initializeMap()
    },
    methods: {
      initializeMap() {
        this.gMap = new google.maps.Map(this.$refs.mapDiv, {
          center: this.mapCenter,
          zoom: this.zoom,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        });
        this.distanceMatrix = new google.maps.DistanceMatrixService;
        this.directionsService = new google.maps.DirectionsService;
        this.placesService = new google.maps.places.PlacesService(this.gMap);
        axios.request(
          this.playerUrl
        ).then(
          (response) => this.updateBoardForPlayer(response)
        )
      },
      hidePlaceInfo: function() {
        this.showPlaceInfo = false
      },
      displayPlaceInfo: function(e) {
        axios.request(
          '/places/' + this.placeReference
        ).then(
          (response) => {
            var placeInfo = response.data
            this.placeInfo = {
              id: placeInfo.id,
              name: placeInfo.name,
              rating: placeInfo.rating,
              foodValue: placeInfo.food_value,
              foodCost: placeInfo.food_cost,
              drinkValue: placeInfo.drink_value,
              drinkCost: placeInfo.drink_cost
            }
            this.showPlaceInfo = true

            var origin = this.mapCenter;
            var destination = new google.maps.LatLng(placeInfo.lat, placeInfo.lng);
            ['Walking', 'Bicycling', 'Driving', 'Transit'].forEach((mode) => {
              var distanceMatrixRequest = {
                origins: [origin],
                destinations: [destination],
                travelMode: google.maps.TravelMode[mode.toUpperCase()]
              };
              this.distanceMatrix.getDistanceMatrix(
                distanceMatrixRequest,
                this['handleDistanceMatrixResponse' + mode]
              )
            });
          }
        )
      },
      // TODO: see if these methods can be refactored
      updateTravelTime(mode, response) {
        this.travelTimes[mode.toLowerCase()] = response.rows[0].elements[0].duration.text
      },
      handleDistanceMatrixResponseWalking(response) {
        this.updateTravelTime('Walking', response) 
      },
      handleDistanceMatrixResponseBicycling(response) {
        this.updateTravelTime('Bicycling', response) 
      },
      handleDistanceMatrixResponseDriving(response) {
        this.updateTravelTime('Driving', response) 
      },
      handleDistanceMatrixResponseTransit(response) {
        this.updateTravelTime('Transit', response) 
      },
      updateBoardForPlayer(response) {
        // var player = response.data.find(function(currentValue, index, arr) { currentValue; return currentValue.is_current_player } )
        // if (player == null) { return; }
        // this.playerName = this.playerName
        this.mapCenter = new google.maps.LatLng(this.lat, this.lng)
        this.gMap.setCenter(this.mapCenter);
        new google.maps.Marker({
          map:this.gMap,
          position: this.mapCenter,
          icon: this.playerAvatarUrl
        })
      },
      getSearchSuggestions() {
        axios.request(
          "/search_suggestions?term=" + this.searchTerm
        ).then(
          (response) => {
            this.searchSuggestions = response.data
          }
        )
        this.searchIsOpen = true
      },
      clearSearchMarkers() {
        for (let i = 0; i < this.$options.liveMarkers.length; i++) {
          this.$options.liveMarkers[i].setMap(null);
        }
        this.$options.liveMarkers = []
      },
  
      addPlaceMarker(place) {
        let marker = this.addMarker(place.geometry.location)
        marker.set('placeReference', place.reference);
        this.placeReference = place.reference; // do we need both of these?
        this.$options.liveMarkers.push(marker);
        google.maps.event.addListener(marker, 'click', this.displayPlaceInfo);
      },


      addMarker(location) {
        return new google.maps.Marker({
          map: this.gMap,
          position: location,
          // icon: markerInfo.icon
        })
      },
  
      searchMap(searchTerm) {
        this.clearSearchMarkers()
        this.placesService.textSearch({
          query: searchTerm,
          bounds: this.gMap.getBounds()
        }, (results, status) => {
          for(let result of results) {
            this.addPlaceMarker(result)
          }
        })
      },
      // this is the main
      doAction(e) {
        var mode = e.target.getAttribute('data-travel-mode')
        console.log(mode)
        var travelTime=this.travelTimes[mode.toLowerCase()]

        axios.request(
          this.playerTravelUrl
        ).then(
          (response) => { /* something */ }
        )
        


    //     if e.target.id == 'place_info_go_taxi'
    //       $("#place_info").hide()
    //       targetText = "Driver please take me to " + placeInfo.name
    //       challengeText = "Say the following:\n\"" + targetText + "\""
    //       $("#challenge").html challengeText
    //       $("#speech").show
    //       # placeInfo = getPlaceInfo(myActivePlaceMarker.position)
    //       thinger = placeInfo

    //     travel_timer = $.timer ->
    //       this.stop
    //       $('#travel_mode_close').show
    //       $('#travel_mode_handle').click ->
    //         finishTravel
    //         $("#travel_mode").hide

    //     travelTime = 10 # for temp
    //     travel_timer.set( time: 1000*travelTime, autostart: true )
    //     $("#place_info").hide
    //     $('#travel_mode_close').hide
    //     $("#travel_mode").show
    //     $.ajax
    //       url: '/players/<%= @player.id %>/start_travel'
    //       type: "GET"
    //       dataType: 'json'
    //       success: (data) ->
    //         handleStartTravel data
      }
    },

    computed: {
      I18n: function() {
        return I18n;
      }
      // TODO: I don't think this needs to be a computed method
      // initializeMap() {
      //   const map = new google.maps.Map(element, {
      //     center: { lat: -34.397, lng: 150.644 },
      //     zoom: 8,
      //   });
      // }
    }
  }
  