import axios from "axios"

const element = document.querySelector("#app_canvas")

export default {
    template: `
      <div id="top_nav" class="row">
        <div id="left" class="col-xs-4">
          <a href="#" id="players_index">Player List</a>
          Current Player:
          <span id="current_player">{{playerName}}</span>
        </div>
        <div class="center col-xs-4">
          <a href="#" id="show_search" class="fancybox">Search Map</a>
        </div>
        <div class="right col-xs-4">
          <a href="#" id="map_control_center" class="fancybox">Center Map</a>
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
          Place Info
          <div id="place_info_content">
            <table>
              <tr>
                <td>ID:</td>
                <td>{{placeInfo.id}}</td>
              </tr>
              <tr>
                <td>Name:</td>
                <td>{{placeInfo.name}}</td>
              </tr>
              <tr>
                <td>Rating:</td>
                <td>{{placeInfo.rating}}</td>
              </tr>
              <tr>
                <td>Travel Time Walking:</td>
                <td>{{placeInfo.travelTimeWalking}}</td>
              </tr>
              <tr>
                <td>Travel Time Bicycling:</td>
                <td>{{placeInfo.travelTimeBicycling}}</td>
              </tr>
              <tr>
                <td>Travel Time Driving:</td>
                <td>{{placeInfo.travelTimeDriving}}</td>
              </tr>
              <tr>
                <td>Travel Time Transit:</td>
                <td>{{placeInfo.travelTimeTransit}}</td>
              </tr>
              <tr>
                <td>Food Value/Food Cost:</td>
                <td>
                  {{placeInfo.foodValue}} / {{placeInfo.foodCost}}
                </td>
              </tr>
              <tr>
                <td>Drink Value/Drink Cost:</td>
                <td>
                  {{placeInfo.drinkValue}} / {{placeInfo.drinkCost}}
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <input id="place_info_go_walk" type="button" value="place_info.go_walk" />
                </td>
                <!-- allow player to have/rent a car - then add driving option -->
              </tr>
              <tr>
                <td></td>
                <td>
                  <input id="place_info_go_taxi" type="button" value="place_info.go_taxi" />
                </td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    `,
    props: ['lat', 'lng', 'zoom', 'playersUrl'],
    data() {
      return {
        gMap: null,
        placesService: null,
        playerName: null,
        searchTerm: '',
        searchSuggestions: [],
        searchIsOpen: false,
        placeReference: null, // I don't necessarily like this
        showPlaceInfo: false,
        placeInfo: {
          id: null,
          name: null,
          rating: null,
          travelTimeWalking: null,
          travelTimeBicycling: null,
          travelTimeDriving: null,
          travelTimeTransit: null,
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
        // this.gMap = new google.maps.Map(element, {
        this.gMap = new google.maps.Map(this.$refs.mapDiv, {
          center: {
            lat: this.lat,
            lng: this.lng
          },
          zoom: this.zoom,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        });
        this.placesService = new google.maps.places.PlacesService(this.gMap);
        axios.request(
          this.playersUrl
        ).then(
          (response) => this.updateBoardForPlayer(response)
        )

        // $("#prefix").autocomplete({
        //   source: "/search_suggestions",
        //   select: function() {
        //     $.fancybox.close();
        //     return $.searchMap();
        //   }
        // });
      },
      hidePlaceInfo: function() {
        this.showPlaceInfo = false
      },
      displayPlaceInfo: function(e) {
        axios.request(
          '/places/' + this.placeReference
        ).then(
          (response) => {
            // alert('hello')
            
            var len, results1;
            results1 = [];
            var placeInfo = response.data
            // for (var k = 0, len = placeInfo.length; k < len; k++) {
            this.placeInfo = {
              id: placeInfo['id'],
              name: placeInfo['name'],
              rating: placeInfo['rating'],
              travelTimeWalking: '123 minutes',
              travelTimeBicycling: '30 minutes',
              travelTimeDriving: '8 minutes',
              travelTimeTransit: '15 minutes',
              foodValue: placeInfo['food_value'],
              foodCost: placeInfo['food_cost'],
              drinkValue: placeInfo['drink_value'],
              drinkCost: placeInfo['drink_cost']
            }
            this.showPlaceInfo = true
            // for (const key in placeInfo) {
            //   results1.push($("#place_info_" + key).html(placeInfo[key]));
            // }
            // return results1;
          }
        )
  
  
        // var distanceMatrixRequest, myActivePlaceMarker, placeDetailsRequest;
        // myActivePlaceMarker = this;
  
        // $("#place_info").css('left', mouseX);
        // $("#place_info").css('top', mouseY);
        // placeDetailsRequest = {
        //   reference: this.placeReference
        // };
        // $.ajax({
        //   url: '/places/' + this.placeReference,
        //   type: "GET",
        //   data: {
        //     external_id: this.placeReference
        //   },
        //   dataType: 'json',
        //   success: function(data) {
        //     return ajaxPlaceHandler(data);
        //   }
        // });
        // placess.getDetails(placeDetailsRequest, handleDetailResult);
        // travelTimes['WALKING'] = travelTimes['BICYCLING'] = travelTimes['DRIVING'] = travelTimes['TRANSIT'] = 0;
        // distanceMatrixRequest = {
        //   origins: [$.myLatLng],
        //   destinations: [this.position],
        //   travelMode: google.maps.TravelMode.WALKING
        // };
        // distanceMatrix.getDistanceMatrix(distanceMatrixRequest, handleDistanceMatrixWalkingResult);
        // distanceMatrixRequest = {
        //   origins: [$.myLatLng],
        //   destinations: [this.position],
        //   travelMode: google.maps.TravelMode.BICYCLING
        // };
        // distanceMatrix.getDistanceMatrix(distanceMatrixRequest, handleDistanceMatrixBicyclingResult);
        // distanceMatrixRequest = {
        //   origins: [$.myLatLng],
        //   destinations: [this.position],
        //   travelMode: google.maps.TravelMode.DRIVING
        // };
        // distanceMatrix.getDistanceMatrix(distanceMatrixRequest, handleDistanceMatrixDrivingResult);
        // return $("#place_info").show();
      },
      updateBoardForPlayer(response) {
        var player = response.data.find(function(currentValue, index, arr) { currentValue; return currentValue.is_current_player } )
        if (player == null) { return; }

        this.playerName = player.name
        var location = new google.maps.LatLng(player.location.lat, player.location.lng)
        
        this.gMap.setCenter(location);
        new google.maps.Marker({
          map:this.gMap,
          position: location,
          icon: player.avatar_urls.small
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

          // var i, j, ref, results1;
          // if (status === google.maps.places.PlacesServiceStatus.OK) {
          //   results1 = [];
          //   for (i = j = 0, ref = results.length - 1; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
          //     results1.push($.addPlaceMarker(results[i]));
          //   }
          //   return results1;
          // }
        });
      },
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
  }
  