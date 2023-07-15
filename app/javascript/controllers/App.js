import axios from "axios"

export default {
    template: `
      <div v-if="localPlayerState=='travel'">
        <div>
          <div>Destination: </div>
          <div>Time to destination: </div>
        </div>
      </div>
      <div v-else style="height: 100%; width: 100%;">
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
        <div ref="mapDiv" style="height: 100%; width: 100%;"></div>
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
      'playerAvatarUrl',
      'playerState'
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
        mapCenter: new google.maps.LatLng(this.lat, this.lng),
        placeIds: [],
        placesInfo: {},
        localPlayerState: this.playerState,
        showPlaceInfo: false,
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
          }
        },
        infoWindow: null
      }
    },
    liveMarkers: [],

    mounted() {
      this.initializeMap()
    },
    methods: {
      infowindowContent(clickAction) {
        return `
        <div id="content">
          <div id="siteNotice"></div>
          <h1 id="firstHeading" class="firstHeading">${this.placeInfo.name}</h1>
          <div id="bodyContent">
            <div id="place_info_content">
              <table>
                <tr>
                  <td>${I18n.place_info.id}:</td>
                  <td>${this.placeInfo.id}</td>
                </tr>
                <tr>
                  <td>${I18n.place_info.name}:</td>
                  <td>${this.placeInfo.name}</td>
                </tr>
                <tr>
                  <td>${I18n.place_info.rating}:</td>
                  <td>${this.placeInfo.rating}</td>
                </tr>
                <tr>
                  <td>${I18n.place_info.travel_time_walking}:</td>
                  <td>
                    ${this.placeInfo.travelTimes.walking.distance}
                    ${this.placeInfo.travelTimes.walking.duration}
                  </td>
                  <td>
                    <button class="travelMode" data-travel-mode="walking" data-destination-place-id=${this.placeInfo.id}>${I18n.place_info.go}</button>
                  </td>
                </tr>
                <tr>
                  <td>${I18n.place_info.travel_time_bicycling}:</td>
                  <td>
                    ${this.placeInfo.travelTimes.bicycling.distance}
                    ${this.placeInfo.travelTimes.bicycling.duration}
                  </td>
                  <td>
                    <button class="travelMode" data-travel-mode="bicycling">${I18n.place_info.go}</button>
                  </td>
                </tr>
                <tr>
                  <td>${I18n.place_info.travel_time_driving}:</td>
                  <td>
                    ${this.placeInfo.travelTimes.driving.distance}
                    ${this.placeInfo.travelTimes.driving.duration}
                  </td>
                  <td>
                    <button class="travelMode" data-travel-mode="driving">${I18n.place_info.go}</button>
                  </td>
                </tr>
                <tr>
                  <td>${I18n.place_info.travel_time_transit}:</td>
                  <td>
                    ${this.placeInfo.travelTimes.transit.distance}
                    ${this.placeInfo.travelTimes.transit.duration}
                  </td>
                  <td>
                    <button class="travelMode" data-travel-mode="transit">${I18n.place_info.go}</button>
                  </td>
                </tr>
                <tr>
                  <td>${I18n.place_info.food_value}/${I18n.place_info.food_cost}:</td>
                  <td>
                    ${this.placeInfo.foodValue} / ${this.placeInfo.foodCost}
                  </td>
                </tr>
                <tr>
                  <td>${I18n.place_info.drink_value}/${I18n.place_info.drink_cost}:</td>
                  <td>
                    ${this.placeInfo.drinkValue} / ${this.placeInfo.drinkCost}
                  </td>
                </tr>
              </table>
            </div>
          `
      },
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
          if(this.infoWindow) {
            this.infoWindow.close()
          }
          this.infoWindow = new google.maps.InfoWindow({
            content: this.infowindowContent(),
            ariaLabel: this.placeInfo.name,
          });
          google.maps.event.addListener(this.infoWindow, 'domready', (thing) => {
            console.log("domready happened")
            document.querySelectorAll('button.travelMode').forEach(
              (el) => el.addEventListener("click", this.doAction)
            )
          })
          this.infoWindow.open({
            anchor: marker,
            map: this.gMap,
          });
          // this.showPlaceInfo = true
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

      searchResultsHandler(results, status) {
        this.placeIds = results.map(result => result.place_id)
        this.placesInfo = results.reduce((accumulator, result) => {
          accumulator[result.place_id] ||= {
            id: result.place_id,
            name: result.name,
            rating: result.rating,
            foodValue: null,
            foodCost: null,
            drinkValue: null,
            drinkCost: null,
          }
          return accumulator;
        }, {})

        // TODO: why does this break things
        // results.forEach((result) => this.addPlaceMarker(result))
        for(let result of results) {
          this.addPlaceMarker(result)
        }

        ['Walking', 'Bicycling', 'Driving', 'Transit'].forEach((mode) => this.getDistances(mode, results))
      },
      getDistances(mode, results) {
        this.distanceMatrix.getDistanceMatrix(
          {
            origins: [this.mapCenter],
            destinations: results.map(result => result.geometry.location),
            travelMode: google.maps.TravelMode[mode.toUpperCase()]
          },
          (result) => this.handleDistanceMatrixResult(result, mode)    
        )
      },
      handleDistanceMatrixResult(result, mode) {
        result.rows[0].elements.forEach((r, i) => {
          this.placesInfo[this.placeIds[i]] ||= {}
          this.placesInfo[this.placeIds[i]]['travelTimes'] ||= {}
          this.placesInfo[this.placeIds[i]]['travelTimes'][mode.toLowerCase()] = {
            distance: r.distance?.text,
            duration: r.duration?.text
          }
        })
      },
      searchMap(searchTerm) {
        this.clearSearchMarkers()

        this.placesService.textSearch(
          {
            query: searchTerm,
            bounds: this.gMap.getBounds()
          },
          this.searchResultsHandler
        )
      },
      // this is the main
      doAction(e) {
        let mode = e.target.dataset.travelMode.toLowerCase()
        let travelTime=this.placeInfo['travelTimes'][mode]

        axios.request(
          this.playerTravelUrl,
          {
            params: {
              mode: mode,
              destination_external_id: e.target.dataset.destinationPlaceId,
              // travel_time: travelTime
            }
          }
        ).then(
          (response) => {
            debugger
          }
        )
      }
    },

    computed: {
      I18n: () => I18n
    }
  }
  