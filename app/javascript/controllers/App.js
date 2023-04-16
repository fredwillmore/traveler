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
                <td>
                  {{placeInfo.travelTimes.walking.distance}}
                  {{placeInfo.travelTimes.walking.duration}}
                </td>
                <td>
                  <input type="button" :value="I18n.place_info.go" data-travel-mode="walking" v-on:click="doAction" />
                </td>
              </tr>
              <tr>
                <td>{{I18n.place_info.travel_time_bicycling}}:</td>
                <td>
                  {{placeInfo.travelTimes.bicycling.distance}}
                  {{placeInfo.travelTimes.bicycling.duration}}
                </td>
                <td>
                  <input type="button" :value="I18n.place_info.go" data-travel-mode="bicycling" v-on:click="doAction" />
                </td>
              </tr>
              <tr>
                <td>{{I18n.place_info.travel_time_driving}}:</td>
                <td>
                  {{placeInfo.travelTimes.driving.distance}}
                  {{placeInfo.travelTimes.driving.duration}}
                </td>
                <td>
                  <input type="button" :value="I18n.place_info.go" data-travel-mode="driving" v-on:click="doAction" />
                </td>
              </tr>
              <tr>
                <td>{{I18n.place_info.travel_time_transit}}:</td>
                <td>
                  {{placeInfo.travelTimes.transit.distance}}
                  {{placeInfo.travelTimes.transit.duration}}
                </td>
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
        searchTerm: '',
        searchSuggestions: [],
        searchIsOpen: false,
        showPlaceInfo: false,
        mapCenter: new google.maps.LatLng(this.lat, this.lng),
        placeIds: [],
        placesInfo: {},
        placeInfo: {
          id: null,
          name: null,
          rating: null,
          foodValue: null,
          foodCost: null,
          drinkValue: null,
          drinkCost: null,
          travelTimes: {
            walking: null,
            bicycling: null,
            driving: null,
            transit: null
          },
        }
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
      updateBoardForPlayer(response) {
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
          (response) => this.searchSuggestions = response.data
        )
        this.searchIsOpen = true
      },
      clearSearchMarkers() {
        for (let i = 0; i < this.$options.liveMarkers.length; i++) {
          this.$options.liveMarkers[i].setMap(null)
        }
        this.$options.liveMarkers = []
      },
  
      addPlaceMarker(place) {
        let marker = this.addMarker(place)
        marker.placeId = place.place_id
        this.$options.liveMarkers.push(marker)
        google.maps.event.addListener(marker, 'click', () => { 
          this.placeInfo = this.placesInfo[marker.placeId]
          this.showPlaceInfo = true
        });
      },

      addMarker(place) {
        return new google.maps.Marker({
          map: this.gMap,
          position: place.geometry.location,
          placeId: place.place_id
          // icon: markerInfo.icon
        })
      },
  
      searchMap(searchTerm) {
        this.clearSearchMarkers()
        let searchResultsHandler = (results, status) => {
          var origins = [this.mapCenter]
          var destinations = []
          var origin = this.mapCenter
          for(let result of results) {
            this.placeIds.push(result.place_id)
            this.placesInfo[result.place_id] ||= {
              id: result.place_id,
              name: result.name,
              rating: result.rating,
              foodValue: null,
              foodCost: null,
              drinkValue: null,
              drinkCost: null,
            }
            destinations.push(result.geometry.location)
            this.addPlaceMarker(result)
          }

          ['Walking', 'Bicycling', 'Driving', 'Transit'].forEach((mode) => {
            let currentMode = mode;
            let distanceMatrixRequest = {
              origins: origins,
              destinations: destinations,
              travelMode: google.maps.TravelMode[mode.toUpperCase()]
            }
            let handleMatrixRequestResults = (result) => {
              result.rows[0].elements.forEach((r, i) => {
                this.placesInfo[this.placeIds[i]] ||= {}
                this.placesInfo[this.placeIds[i]]['travelTimes'] ||= {}
                this.placesInfo[this.placeIds[i]]['travelTimes'][currentMode.toLowerCase()] = {
                  distance: r.distance.text,
                  duration: r.duration.text
                }
              })
            }
            this.distanceMatrix.getDistanceMatrix(
              distanceMatrixRequest,
              handleMatrixRequestResults
            )
          })
        }

        this.placesService.textSearch(
          {
            query: searchTerm,
            bounds: this.gMap.getBounds()
          },
          searchResultsHandler
        )
      },
      // this is the main
      doAction(e) {
        let mode = e.target.getAttribute('data-travel-mode')
        let travelTime=this.placeInfo['travelTimes'][mode.toLowerCase()]

        axios.request(
          this.playerTravelUrl
        ).then(
          (response) => { /* something */ }
        )
      }
    },

    computed: {
      I18n: () => I18n
    }
  }
  