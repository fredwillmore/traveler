# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# GLOBALS
map
placess
distanceMatrix
directionsService
placeInfo
travelTime
mouseX
mouseY
myMarker
liveMarkers = new Array
myActivePlaceMarker
handleSearchResults_complete = false # these are used to track the status of the api callback handlers
handleDetailResult_complete = false # these are used to track the status of the api callback handlers
handleDistancMatrixResult_complete = false # these are used to track the status of the api callback handlers
targetText = '' # for evaluating challenge
travelTimes = new Object
# initialize travel times
travelTimes['WALKING'] = travelTimes['BICYCLING'] = travelTimes['DRIVING'] = travelTimes['TRANSIT'] = 0

searchMap = ->
  liveMarker
  while liveMarker = liveMarkers.pop
    liveMarker.setMap null
    placeTypeChecked = $('input:checkbox[name=placeTypes]:checked')
    if placeTypeChecked.length > 0
      placeTypes = new Array
      for i in [0..i<placeTypeChecked.length]
        placeTypes[i] = placeTypeChecked[i].value
      myPlaceSearchOptions =
        location: map.getCenter
#        location: $.myLatLng
        bounds: map.getBounds
        types: placeTypes
        radius: 500
      placess.search myPlaceSearchOptions, handleSearchResults


handleSearchResults = (results, status) ->
  if status == google.maps.places.PlacesServiceStatus.OK
    for i in [0..results.length]
      place = results[i]
      addPlaceMarker place
  handleSearchResults_complete = true


addMarker = (location, markerInfo) ->
  myIcon
  if markerInfo && markerInfo.icon
    myIcon = markerInfo.icon
  else
    myIcon = null
  myMarkerOptions =
    map: map
    position: location
    icon: myIcon
  marker = new google.maps.Marker myMarkerOptions
  return marker


addPlaceMarker = (place) ->
  marker = addMarker place.geometry.location
  marker.set 'placeReference', place.reference
  liveMarkers.push marker
  google.maps.event.addDomListener marker, 'click', showPlaceInfo
#  google.maps.event.addDomListener marker, 'mouseout', hidePlaceInfo
  return marker


handleDetailResult = (result, status) ->
  if status == google.maps.places.PlacesServiceStatus.OK
    placeInfo =
      food: 0
      drink: 0
      entertainment: 0
      cost: 0
      types: result.types
      name: result.name
      rating: result.rating
      id: result.id

    for i in [0..placeInfo.types.length]
      type = placeInfo.types[i]
      switch type
        # move these magic numbers
        when 'bar'
          placeInfo.food += 8
          placeInfo.drink += 10
          placeInfo.cost += 5
        when 'cafe'
          placeInfo.food += 5
#          placeInfo.caffeine += 5;
          placeInfo.cost += 3

    $("#place_info_handle_name").html placeInfo.name
    $("#place_info_id").html placeInfo.id
    $("#place_info_name").html placeInfo.name
    $("#place_info_rating").html placeInfo.rating
    $("#place_info_food").html placeInfo.food
    $("#place_info_drink").html placeInfo.drink
    $("#place_info_entertainment").html placeInfo.entertainment
    $("#place_info_cost").html placeInfo.cost

  handleDetailResult_complete = true


  handleDistanceMatrixResult = (result, status, travelMode) ->
    if status == google.maps.DistanceMatrixStatus.OK
      travelTime = result.rows[0].elements[0].duration
      travelTimes[travelMode] = travelTime.value
      $("#place_info_travelTime"+travelMode).html travelTime.text
    handleDistancMatrixResult_complete = true

  handleDistanceMatrixWalkingResult = (result, status) ->
    handleDistanceMatrixResult result, status, 'WALKING'

  handleDistanceMatrixBicyclingResult = (result, status) ->
    handleDistanceMatrixResult result, status, 'BICYCLING'

  handleDistanceMatrixDrivingResult = (result, status) ->
    handleDistanceMatrixResult result, status, 'DRIVING'

  handleDirectionsServiceTransitResult = (result, status) ->
    handleDistanceMatrixResult result, status, 'TRANSIT'

  handleDirectionsServiceResult = (result, status) ->
    if result
      alert 'hello got yer directions'

  showPlaceInfo = ->
    myActivePlaceMarker = this
    $("#place_info").css 'left', mouseX
    $("#place_info").css 'top', mouseY
    placeDetailsRequest =
      reference: this.placeReference


    $.ajax
      url: '/places/'+this.placeReference
      type: "GET"
      data:
        external_id: this.placeReference
#        player_id: < %= @player.id % >
      dataType: 'json'
      success: (data) ->
        ajaxPlaceHandler data


    placess.getDetails placeDetailsRequest, handleDetailResult

    # initialize travel times
    travelTimes['WALKING'] = travelTimes['BICYCLING'] = travelTimes['DRIVING'] = travelTimes['TRANSIT'] = 0

    distanceMatrixRequest =
      origins: [$.myLatLng]
      destinations: [this.position]
      travelMode:google.maps.TravelMode.WALKING
    distanceMatrix.getDistanceMatrix distanceMatrixRequest, handleDistanceMatrixWalkingResult

    distanceMatrixRequest =
      origins: [$.myLatLng]
      destinations: [this.position]
      travelMode:google.maps.TravelMode.BICYCLING
    distanceMatrix.getDistanceMatrix distanceMatrixRequest, handleDistanceMatrixBicyclingResult

    distanceMatrixRequest =
      origins: [$.myLatLng]
      destinations: [this.position]
      travelMode:google.maps.TravelMode.DRIVING
    distanceMatrix.getDistanceMatrix distanceMatrixRequest, handleDistanceMatrixDrivingResult

    # doing transit option in another iteration; current issue is that destination needs to be a text string or latLng but there are a host of other issues as well
#        directionsServiceRequest = {
#            origin: [$.myLatLng],
#            destination: [this.position],
#            travelMode: google.maps.DirectionsTravelMode.TRANSIT
#        }
#        directionsService.route(directionsServiceRequest, handleDirectionsServiceTransitResult);
    $("#place_info").show()

  ajaxPlaceHandler = (placeInfo) ->
    for attribute in placeInfo
      $("#place_info_"+attribute).html placeInfo[attribute]

  hidePlaceInfo = ->
    $("#place_info").hide

  evaluateChallenge = (input) ->
    punctuation = /['";:,.\/?\\-]/g

    if input.toLowerCase().replace(punctuation, '') == targetText.toLowerCase().replace punctuation, ''
      alert "yeah!"
    else
      alert "nope"

    $.ajax
      url: '/places/'+this.placeReference
      type: "GET"
      data:
        external_id: this.placeReference
      #                player_id: < %= @player.id % >
      ,
      dataType: 'json'
      success: (data) ->
        ajaxPlaceHandler data
      #end success: -> result

#    google.maps.event.addDomListener window, 'load', initialize

# NOW FOR JQUERY STUFF
$(document).ready ->
  $.playerInfo = new Object
  # for testing!!!
  getChallenge 1
#<%
#  # @player.attributes.each do |key, value|
#%>
#  $.playerInfo['< %= key % >'] = '< %= value % >'
#<%
## end
#%>
#        $.myLatLng = new google.maps.LatLng(< %= @player_location.lat % >, < %= @player_location.lng % >);

  myMapOptions =
    zoom: 17
    center: $.myLatLng
    mapTypeId: google.maps.MapTypeId.ROADMAP
    disableDefaultUI: true
#    disableDoubleClickZoom: true
  map = new google.maps.Map document.getElementById('map_canvas'), myMapOptions
#  google.maps.event.addDomListener map, 'dragend', searchMap
  google.maps.event.addDomListener map, 'resize', searchMap
  google.maps.event.addDomListener map, 'zoom_changed', searchMap
  google.maps.event.addDomListener map, 'center_changed', searchMap

  google.maps.event.addDomListener map, 'click', (event) ->
    mapZoom = map.getZoom()
    startLocation = event.latLng


  placess = new google.maps.places.PlacesService map
  distanceMatrix = new google.maps.DistanceMatrixService
  directionsService = new google.maps.DirectionsService

  myMarkerInfo =
    icon: '<%= image_path "fw.jpg" %>'

  myMarker = addMarker $.myLatLng, myMarkerInfo
  google.maps.event.addDomListener myMarker, 'click', showPlayerInfo

  $(document).keyup (e) ->
    if (e.keyCode == 27)
      $("#player_info").hide
      $("#place_info").hide

  $('#search_bar').click

  $().mousemove (e) ->
    mouseX = e.pageX
    mouseY = e.pageY

  #jQuery events go here
  $('#player_info').draggable
    zIndex:    20
    ghosting:false
    opacity: 0.7
    handle:    '#player_info_handle'

  $("#player_info").hide

  $('#player_info_display').click ->
    $("#player_info_content").show
    $("#current_location_content").hide
    $("#search_area_content").hide

  $('#current_location_display').click ->
    $("#player_info_content").hide
    $("#current_location_content").show
    $("#search_area_content").hide

  $('#search_area_display').click ->
    $("#player_info_content").hide
    $("#current_location_content").hide
    $("#search_area_content").show

  $('#player_info_close').click ->
    $("#player_info").hide

  $('#place_info').draggable
    zIndex:    20
    ghosting:false
    opacity: 0.7
    handle:    '#place_info_handle'

  $("#place_info_go_walk").click doAction
  $("#place_info_go_taxi").click doAction
  $("#place_info").hide

  $('#place_info_close').click () ->
    $("#place_info").hide

  $('#place_info_handle').click () ->
    $("#place_info").hide

  $('#speech').draggable
    zIndex:    20
    ghosting:false
    opacity: 0.7
    handle:    '#speech_handle'

  $("#speech").hide

  $('#speech_close').click ->
    $("#speech").hide

  $('#speech_handle').click ->
    $("#speech").hide

  $('#map_control').click ->
    map.setCenter $.myLatLng

  $('#submit_button').click ->
    evaluateChallenge final_transcript

  $("#travel_mode").hide

#  <% for counter in 1..@player.level %>
#    $("#get_challenge_<%= counter %>").click( ->()
#      getChallenge(<%= counter %>);
#    );
#  <% end %>

  getChallenge = (level) ->
    $.ajax
      type: 'GET'
      url: '/challenges/' + level + '/get_by_level'
      dataType: 'json'
#      data:
  #                    base_locale: '< %= # @player.base_locale % >'
  #                    target_locale: '< %= # @player.target_locale % >'
      success: (data) ->
        ajaxChallengeHandler data


  ajaxChallengeHandler = (challengeData) ->
    debugger
    targetText = challengeData['challenge_text']
    challengeText = "Say the following:\n\"" + targetText + "\""
    $("#speech").show
    $("#challenge").html challengeText
    $("#challenge").show

  showPlayerInfo = ->
    $("#player_info").css 'left', mouseX
    $("#player_info").css 'top', mouseY
    $.ajax
      type: 'GET'
      url: '/players/1'
      dataType: 'json'
      success: (data) ->
        ajaxPlayerHandler data
#      success: -> result
    $("#player_info").show
    $('#player_info_display').click

  ajaxPlayerHandler = (playerData) ->
#    date = new Date(playerData.time*1000)
#    hours = date.getHours()
#    minutes = date.getMinutes()
#    $("#player_info_time").html(hours + ':' + minutes)
    $.ajax
      type: 'GET'
      url: '/locations/' + playerData.location_id
      dataType: 'json'
      success: (data) ->
        ajaxCurrentLocationHandler data
      #end success: -> result
    for attribute in playerData
      $.playerInfo[attribute] = playerData[attribute]
      $("#player_info_"+attribute).html playerData[attribute]

  ajaxCurrentLocationHandler = (locationInfo) ->
    for attribute in locationInfo
      $("#current_location_"+attribute).html locationInfo[attribute]

  # this is the one that does it
  doAction = (e) ->
    if(e.target.id == 'place_info_go_walk')
      travelTime=travelTimes['WALKING'];
#          this stuff could be used for making an interesting animation of moving in real time
#              but for now I'm just going to enter travel mode and call it good
#                      directionsServiceRequest = {
#                          origin: [$.myLatLng],
#                          destination: [myActivePlaceMarker.position],
#                          travelMode: google.maps.DirectionsTravelMode.WALKING
#                      }
#                      directionsService.route(directionsServiceRequest, handleDirectionsServiceResult);
    if e.target.id == 'place_info_go_taxi'
      travelTime=travelTimes['DRIVING']
      $("#place_info").hide()
      targetText = "Driver please take me to " + placeInfo.name
      challengeText = "Say the following:\n\"" + targetText + "\""
      $("#challenge").html challengeText
      $("#speech").show
      # placeInfo = getPlaceInfo(myActivePlaceMarker.position)
      thinger = placeInfo

    travel_timer = $.timer ->
      this.stop
      $('#travel_mode_close').show
      $('#travel_mode_handle').click ->
        finishTravel
        $("#travel_mode").hide

    travelTime = 10 # for temp
    travel_timer.set( time: 1000*travelTime, autostart: true )
    $("#place_info").hide
    $('#travel_mode_close').hide
    $("#travel_mode").show
    $.ajax
      url: '/players/<%= @player.id %>/start_travel'
      type: "GET"
      dataType: 'json'
      success: (data) ->
        handleStartTravel data


  finishTravel= ->
    myMarker.setPosition myActivePlaceMarker.position
    map.panTo myActivePlaceMarker.position

#    $.playerInfo.time = parseInt $.playerInfo.time + parseInt travelTime.value
    $.playerInfo.money = parseInt $.playerInfo.money - parseInt placeInfo.cost
    $.playerInfo.food = parseInt $.playerInfo.food + parseInt placeInfo.food
    $.playerInfo.drink = parseInt $.playerInfo.drink + parseInt placeInfo.drink
    $.playerInfo.happiness = parseInt $.playerInfo.happiness + parseInt placeInfo.entertainment
#    $("#player_info_time").html $.playerInfo.time
    $("#player_info_money").html $.playerInfo.money
    $.ajax
      url: '/players/<%= @player.id %>/finish_travel'
      type: "GET"
      dataType: 'json'
      success: (data) ->
        handleFinishTravel data

  handleStartTravel = data ->
    noop = data;

  handleFinishTravel = data ->
    noop = data;
