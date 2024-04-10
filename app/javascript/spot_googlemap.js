var map
let markerLatLng;
var marker = [];
var infoWindow = [];
let place_name = [];
var place_lat = [];
var place_lng = [];
const markerData = gon.spots;
const markerDataLat = gon.spots_latitudes;
const markerDataLng = gon.spots_longitudes;

function initMap(){    
  map = new google.maps.Map(document.getElementById('map_index'), { 
    center: {lat: gon.prefecture.latitude, lng: gon.prefecture.longitude},
    zoom: 9,
    maxZoom: 15,
  });
  if (markerData != 0){
  map.fitBounds(new google.maps.LatLngBounds(
    {lat: Math.min(...markerDataLat),lng: Math.min(...markerDataLng)},
    {lat: Math.max(...markerDataLat),lng: Math.max(...markerDataLng)}
  ))};

  for (var i = 0; i < markerData.length; i++) {
    markerLatLng = new google.maps.LatLng({
      lat: markerData[i]['latitude'],
      lng: markerData[i]['longitude']
    });

    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map
    });

    let id = markerData[i]['id']
    place_name[i]= markerData[i]['address'];
    place_lat[i]= markerData[i]['latitude'];
    place_lng[i]= markerData[i]['longitude'];
    infoWindow[i] = new google.maps.InfoWindow({
      content: `${ markerData[i]['address'] }<input id= "btn" type="button" value="追加" onclick="addPlace(place_name, place_lat, place_lng, ${i})">`
    });
    markerEvent(i);
  }
}

function markerEvent(i) {
  marker[i].addListener('click', function () {
    infoWindow[i].open(map, marker[i]);
  });
}

function addPlace(name, lat, lng, number){
  var li = $('<li>', {
    text: name[number],
    "class": "list-group-item"
  });
  li.attr("data-lat", lat[number]); 
  li.attr("data-lng", lng[number]);
  $('#route-list').append(li); 
  let cnt = $('#route-list li');
  if (cnt.length > 2){
    cnt.eq(0).remove();
    }
}
  
function search() {
  initMap()
  var points = $('#route-list li');
  if (points.length = 2){
    var origin;
    var destination;
  
    for (var i = 0; i < points.length; i++) {
      points[i] = new google.maps.LatLng($(points[i]).attr("data-lat"), $(points[i]).attr("data-lng"));
      if (i == 0){
        origin = points[i];
      } else if (i == 1){
        destination = points[i];
      } 
    }
  
    var request = {
      origin:      origin,
      destination: destination,
      travelMode:  google.maps.TravelMode.DRIVING
    };

    new google.maps.DirectionsService().route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        new google.maps.DirectionsRenderer({
          map: map,
          suppressMarkers : true,
          polylineOptions: { 
            strokeColor: '#0033FF',
            strokeOpacity: 1,
            strokeWeight: 5
          }
        }).setDirections(response);

        var data = response.routes[0].legs;
        let duration = data[0].duration.text;
        var routeTime = document.getElementById("display-list");
        routeTime.innerHTML = "およそ" + duration + "で着きます";       
      }
    });
  }
}

function reset() {
  location.reload()
}

window.initMap = initMap
window.addPlace = addPlace
window.place_name = place_name
window.place_lat = place_lat
window.place_lng = place_lng
window.search = search
window.reset = reset
